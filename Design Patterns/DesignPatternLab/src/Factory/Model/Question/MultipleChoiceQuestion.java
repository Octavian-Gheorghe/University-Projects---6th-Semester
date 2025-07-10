package Factory.Model.Question;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class MultipleChoiceQuestion extends Question
{
    private final List<String> options;
    private Set<Character> correctOptions;

    public MultipleChoiceQuestion(String questionText, List<String> options, Set<Character> correctOptions) {
        super(questionText);
        this.options = options;
        this.correctOptions = new HashSet<>();
        for (char c : correctOptions)
        {
            this.correctOptions.add(Character.toLowerCase(c));
        }
    }

    @Override
    public void display() {
        System.out.println(questionText);
        char label = 'a';
        for (String option : options)
        {
            System.out.println(label++ + ") " + option);
        }
        System.out.println("Select all correct answers (e.g. acd):");
    }

    @Override
    public boolean checkAnswer(String userInput) {
        if (userInput == null)
            return false;
        Set<Character> userSet = new HashSet<>();
        for (char c : userInput.toLowerCase().toCharArray())
        {
            if (c < 'a' || c > 'd')
                return false;
            userSet.add(c);
        }
        return userSet.equals(correctOptions);
    }
}
