package Strategy;

import java.util.List;

public class StrictScoringStrategy implements ScoringStrategy {
    @Override
    public int calculateScore(List<Boolean> answerResults) {
        int score = 0;
        for (boolean result : answerResults) {
            if (result) score++;
        }
        return score;
    }
}
