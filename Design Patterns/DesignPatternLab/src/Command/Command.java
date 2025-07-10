package Command;

import java.util.Scanner;

public interface Command {
    boolean execute(Scanner scanner);  // returns whether the answer was correct or not
}