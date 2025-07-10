package Strategy;

import java.util.List;

public class AlternativeScoringStrategy implements ScoringStrategy
{
    @Override
    public int calculateScore(List<Boolean> answerResults) {
        int score = 0;
        for (boolean result : answerResults) {
            score += result ? 2 : -1;
        }
        return Math.max(score, 0);
    }
}
