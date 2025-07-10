package Factory.Model.Question;

import java.util.List;

public class SingleChoiceQuestion extends Question
{
    private final List<String> options;
    private char correctOption;

    public SingleChoiceQuestion(String questionText, List<String> options, char correctOption)
    {
        super(questionText);
        this.options = options;
        this.correctOption = Character.toLowerCase(correctOption);
    }

    @Override
    public void display()
    {
        System.out.println(questionText);
        char label = 'a';
        for (String option : options)
        {
            System.out.println(label++ + ") " + option);
        }
    }

    @Override
    public boolean checkAnswer(String userInput)
    {
        if (userInput == null || userInput.length() != 1)
            return false;
        char answer = Character.toLowerCase(userInput.charAt(0));
        return answer == correctOption;
    }
}
