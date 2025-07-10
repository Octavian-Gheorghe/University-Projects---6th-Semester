package Command;

import Composite.QuizComponent;

import java.util.Scanner;

public class UndefinedAnswerCommand implements Command {
    private final QuizComponent component;

    public UndefinedAnswerCommand(QuizComponent component) {
        this.component = component;
    }

    @Override
    public boolean execute(Scanner scanner) {
        System.out.println("Undefined response to the command.");
        return false;
    }
}
