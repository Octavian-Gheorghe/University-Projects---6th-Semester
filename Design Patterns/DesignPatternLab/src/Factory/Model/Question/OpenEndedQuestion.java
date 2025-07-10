package Factory.Model.Question;

public class OpenEndedQuestion extends Question
{
    private String correctAnswer;

    public OpenEndedQuestion(String questionText, String correctAnswer)
    {
        super(questionText);
        this.correctAnswer = correctAnswer.toLowerCase().trim();
    }

    @Override
    public void display()
    {
        System.out.println(questionText.replace("...", "_____"));
    }

    @Override
    public boolean checkAnswer(String userInput)
    {
        return userInput != null && userInput.trim().equalsIgnoreCase(correctAnswer);
    }
}
