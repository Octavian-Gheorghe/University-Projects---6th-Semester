package Factory.Model.QuestionConfig;

import Factory.Model.Question.OpenEndedQuestion;
import Factory.Model.Question.Question;

public class OpenEndedQuestionConfig implements QuestionConfig
{
    private String questionText;
    private String correctAnswer;

    public OpenEndedQuestionConfig(String questionText, String correctAnswer) {
        this.questionText = questionText;
        this.correctAnswer = correctAnswer;
    }

    @Override
    public Question createInstance() {
        return new OpenEndedQuestion(questionText, correctAnswer);
    }
}
