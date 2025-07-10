package Observer;

import Command.Command;
import Composite.QuizComponent;
import Composite.QuizComposite;
import Strategy.ScoringStrategy;
import Command.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class TimedQuizComposite extends QuizComposite implements TimerListener {
    private boolean timeUp = false;
    private final QuizTimer timer;

    public TimedQuizComposite(ScoringStrategy strategy, QuizTimer timer) {
        super(strategy);
        this.timer = timer;
    }

    @Override
    public boolean checkAnswer(Scanner scanner) {
        timer.start();
        List<Boolean> results = new ArrayList<>();
        QuizCommandInvoker invoker = new QuizCommandInvoker();
        for (QuizComponent component : components) {
            if (timeUp) {
                System.out.println("\nTime's up! Ending quiz.");
                break;
            }
            component.display();
            System.out.println("Type 'skip' to skip or anything else to answer:");
            String input = scanner.nextLine();

            Command command = new UndefinedAnswerCommand(component);
            if(input.equalsIgnoreCase("skip"))
                command = new SkipQuestionCommand(component);
            else if(input.equalsIgnoreCase("ready"))
                command = new SubmitAnswerCommand(component);

            boolean isCorrect = invoker.runCommand(command, scanner);
            System.out.println(isCorrect ? "Correct!\n" : "Wrong!\n");
            results.add(isCorrect);
        }
        timer.stop();
        int score = scoringStrategy.calculateScore(results);
        int maxScore = scoringStrategy.calculateScore(getMaxResultList());
        System.out.println("Final Score: " + score + "/" + maxScore);
        return true;
    }

    @Override
    public void timeUp() {
        this.timeUp = true;
    }
}
