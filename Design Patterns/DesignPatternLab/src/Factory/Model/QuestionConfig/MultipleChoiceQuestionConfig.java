package Factory.Model.QuestionConfig;

import Factory.Model.Question.MultipleChoiceQuestion;
import Factory.Model.Question.Question;

import java.util.List;
import java.util.Set;

public class MultipleChoiceQuestionConfig implements QuestionConfig
{
    private String questionText;
    private List<String> options;
    private Set<Character> correctOptions;

    public MultipleChoiceQuestionConfig(String questionText, List<String> options, Set<Character> correctOption) {
        this.questionText = questionText;
        this.options = options;
        this.correctOptions = correctOption;
    }

    @Override
    public Question createInstance() {
        return new MultipleChoiceQuestion(questionText, options, correctOptions);
    }
}
