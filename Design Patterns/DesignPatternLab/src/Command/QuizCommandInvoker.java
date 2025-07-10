package Command;

import java.util.Scanner;

public class QuizCommandInvoker {
    public boolean runCommand(Command command, Scanner scanner) {
        return command.execute(scanner);
    }
}