package Strategy;

import java.util.List;

public interface ScoringStrategy {
    int calculateScore(List<Boolean> answerResults);
}