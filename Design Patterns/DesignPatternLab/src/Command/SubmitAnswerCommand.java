package Command;

import Composite.QuizComponent;
import java.util.Scanner;

public class SubmitAnswerCommand implements Command {
    private final QuizComponent component;

    public SubmitAnswerCommand(QuizComponent component) {
        this.component = component;
    }

    @Override
    public boolean execute(Scanner scanner) {
        return component.checkAnswer(scanner);
    }
}