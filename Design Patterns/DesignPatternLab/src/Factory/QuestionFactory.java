package Factory;

import Factory.Model.Question.Question;
import Factory.Model.QuestionConfig.QuestionConfig;

import java.util.HashMap;
import java.util.Map;

public class QuestionFactory {
    private final Map<String, QuestionConfig> questionConfigs;

    public QuestionFactory()
    {
        questionConfigs = new HashMap<>();
    }

    public void registerQuestion(String id, QuestionConfig config)
    {
        questionConfigs.put(id.toLowerCase(), config);
    }

    public Question createQuestion(String id) {
        QuestionConfig config = questionConfigs.get(id.toLowerCase());
        if (config == null) {
            throw new IllegalArgumentException("No question registered with id: " + id);
        }
        return config.createInstance();
    }
}
