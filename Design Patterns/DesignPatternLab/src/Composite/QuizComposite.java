package Composite;

import Command.*;
import Strategy.ScoringStrategy;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class QuizComposite implements QuizComponent {
    protected final List<QuizComponent> components = new ArrayList<>();
    protected final ScoringStrategy scoringStrategy;

    public QuizComposite(ScoringStrategy strategy) {
        this.scoringStrategy = strategy;
    }

    public void add(QuizComponent component) {
        components.add(component);
    }

    @Override
    public void display() {
        for (QuizComponent component : components) {
            component.display();
        }
    }

    @Override
    public boolean checkAnswer(Scanner scanner) {
        List<Boolean> results = new ArrayList<>();
        QuizCommandInvoker invoker = new QuizCommandInvoker();

        for (QuizComponent component : components) {

            component.display();
            System.out.println("Type 'skip' to skip or 'ready' to answer:");
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

        int score = scoringStrategy.calculateScore(results);
        int maxScore = scoringStrategy.calculateScore(getMaxResultList());

        System.out.println("Final Score: " + score + "/" + maxScore);
        return true;
    }

    protected List<Boolean> getMaxResultList() {
        List<Boolean> maxList = new ArrayList<>();
        for (int i = 0; i < components.size(); i++) {
            maxList.add(true);
        }
        return maxList;
    }
}
