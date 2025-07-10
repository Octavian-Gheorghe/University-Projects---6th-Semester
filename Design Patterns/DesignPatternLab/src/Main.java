import Composite.*;

import Factory.QuestionFactory;
import Factory.Model.QuestionConfig.*;
import Strategy.*;
import Observer.*;

import java.util.*;

public class Main {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        QuestionFactory factory = new QuestionFactory();

        // Registering questions
        factory.registerQuestion("q1", new SingleChoiceQuestionConfig(
                "What is the capital of France?",
                Arrays.asList("Paris", "Rome", "Madrid", "Berlin"),
                'a'
        ));
        factory.registerQuestion("q2", new MultipleChoiceQuestionConfig(
                "Which of the following are prime numbers?",
                Arrays.asList("2", "4", "5", "9"),
                Set.of('a', 'c')
        ));
        factory.registerQuestion("q3", new OpenEndedQuestionConfig(
                "The process of water turning into vapor is called ...",
                "evaporation"
        ));

        // === User chooses quiz settings ===
        System.out.println("Do you want a timed quiz? (yes/no): ");
        boolean isTimed = scanner.nextLine().trim().equalsIgnoreCase("yes");

        System.out.println("Choose scoring strategy: (1) Strict (2) Alternative: ");
        String scoringChoice = scanner.nextLine().trim();
        ScoringStrategy strategy = scoringChoice.equals("1") ?
                new StrictScoringStrategy() : new AlternativeScoringStrategy();

        // === Construct quiz ===
        QuizComposite quiz;

        if (isTimed) {
            QuizTimer timer = new QuizTimer(1);
            TimedQuizComposite timedQuiz = new TimedQuizComposite(strategy, timer);
            timer.addListener(timedQuiz);
            quiz = timedQuiz;
        } else {
            quiz = new QuizComposite(strategy);
        }

        // Add questions
        quiz.add(new QuestionLeaf(factory.createQuestion("q1")));
        quiz.add(new QuestionLeaf(factory.createQuestion("q2")));
        quiz.add(new QuestionLeaf(factory.createQuestion("q3")));

        // Start the quiz
        System.out.println("\n===== Starting Quiz =====\n");
        quiz.checkAnswer(scanner);
    }
}
