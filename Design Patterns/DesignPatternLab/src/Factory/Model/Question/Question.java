package Factory.Model.Question;

public abstract class Question
{
    protected String questionText;

    public Question(String questionText) {
        this.questionText = questionText;
    }

    public abstract void display();

    public abstract boolean checkAnswer(String userInput);
}
