package Factory.Model.QuestionConfig;

import Factory.Model.Question.*;

import java.util.List;

public class SingleChoiceQuestionConfig implements QuestionConfig{
    private String questionText;
    private List<String> options;
    private char correctOption;

    public SingleChoiceQuestionConfig(String questionText, List<String> options, char correctOption) {
        this.questionText = questionText;
        this.options = options;
        this.correctOption = correctOption;
    }

    @Override
    public Question createInstance() {
        return new SingleChoiceQuestion(questionText, options, correctOption);
    }
}
