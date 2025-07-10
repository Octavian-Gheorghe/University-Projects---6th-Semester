package Observer;

import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

public class QuizTimer
{
    private final List<TimerListener> listeners = new ArrayList<>();
    private Timer timer;
    int seconds;

    public QuizTimer(int seconds)
    {
        this.seconds = seconds;
    }

    public void addListener(TimerListener listener)
    {
        listeners.add(listener);
    }

    public void start()
    {
        timer = new Timer();
        timer.schedule(new TimerTask()
        {
            public void run()
            {
                for (TimerListener l : listeners)
                {
                    l.timeUp();
                }
            }
        }, seconds * 1000);
    }

    public void stop()
    {
        if (timer != null)
            timer.cancel();
    }
}
