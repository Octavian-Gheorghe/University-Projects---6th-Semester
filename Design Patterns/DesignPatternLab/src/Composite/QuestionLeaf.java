package Composite;

import Factory.Model.Question.Question;

import java.util.Scanner;

public class QuestionLeaf implements QuizComponent {
    private final Question question;

    public QuestionLeaf(Question question) {
        this.question = question;
    }

    @Override
    public void display() {
        question.display();
    }

    @Override
    public boolean checkAnswer(Scanner scanner) {
        String userInput = scanner.nextLine();
        return question.checkAnswer(userInput);
    }
}
