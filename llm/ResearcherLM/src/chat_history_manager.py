import sqlite3
from datetime import datetime
import hashlib
class ChatHistoryManager:
    def __init__(self, embedding_model, db_path="chat_history.db", persist_dir="./chat_history_chroma"):
        self.conn = sqlite3.connect(db_path)
        self.embedding_model = embedding_model

        self.vectorstore = Chroma(
            embedding_function=self.embedding_model,
            persist_directory=persist_dir,
            collection_name="chat_history"
        )

        self._create_table()

    def _create_table(self):
        with self.conn:
            self.conn.execute("""
            CREATE TABLE IF NOT EXISTS chat_history (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                question TEXT NOT NULL,
                answer TEXT NOT NULL,
                timestamp TEXT NOT NULL,
                user_hash TEXT NOT NULL
            )
            """)

    def _hash_ip(self, ip_address):
        """Hash the IP address securely."""
        return hashlib.sha256(ip_address.encode()).hexdigest()

    def save_message(self, question, answer, user_ip):
        user_hash = self._hash_ip(user_ip)

        with self.conn:
            cursor = self.conn.cursor()
            cursor.execute("""
            INSERT INTO chat_history (question, answer, timestamp, user_hash)
            VALUES (?, ?, ?, ?)
            """, (question, answer, datetime.utcnow().isoformat(), user_hash))
            chat_id = cursor.lastrowid

        # Save question embedding separately, also include user_hash in metadata
        doc = Document(page_content=question, metadata={"chat_id": chat_id, "user_hash": user_hash})
        self.vectorstore.add_documents([doc])

    def search_history(self, query, user_ip, top_k=5):
        """Search only inside this user's history."""
        user_hash = self._hash_ip(user_ip)

        # Vectorstore search first
        query_results = self.vectorstore.similarity_search(query, k=top_k)

        # Filter only results belonging to this user
        filtered_chat_ids = [
            str(doc.metadata["chat_id"]) for doc in query_results
            if doc.metadata.get("user_hash") == user_hash
        ]

        if not filtered_chat_ids:
            return []

        placeholder = ",".join(["?"] * len(filtered_chat_ids))

        cursor = self.conn.cursor()
        cursor.execute(f"""
        SELECT question, answer FROM chat_history
        WHERE id IN ({placeholder})
        """, filtered_chat_ids)

        return cursor.fetchall()