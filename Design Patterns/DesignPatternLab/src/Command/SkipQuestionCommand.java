package Command;

import Composite.QuizComponent;
import java.util.Scanner;

public class SkipQuestionCommand implements Command {
    private final QuizComponent component;

    public SkipQuestionCommand(QuizComponent component) {
        this.component = component;
    }

    @Override
    public boolean execute(Scanner scanner) {
        System.out.println("Question skipped.");
        return false;
    }
}