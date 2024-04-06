
class FadeOutInScreen implements Update, Show, AfterReset {
    Screen newScreen;
    int alpha = 0;
    int speed = 0;
    int fadeOutSpeed, fadeInSpeed;

    FadeOutInScreen(Screen screen, int fadeOutSpeed, int fadeInSpeed) {
        newScreen = screen;
        this.fadeOutSpeed = fadeOutSpeed;
        this.fadeInSpeed = fadeInSpeed;
        inputLock = true;
        fadeOut();
    }

    void fadeIn() {
        speed = -fadeInSpeed;
        engine.addShow(this);
        engine.addUpdate(this);
    }

    void fadeOut() {
        speed = fadeOutSpeed;
        engine.addShow(this);
        engine.addUpdate(this);
    }

    void update() {
        alpha += speed;

        if (alpha > 255) {
            alpha = 255;
            speed = 0;
            screen = newScreen;
            statistics.toggle(); // TODO::read notes on this
            engine.reset(this);
        } else if (alpha < 0) {
            alpha = 0;
            speed = 0;
            engine.removeUpdate(this);
            engine.removeShow(this);
            inputLock = false;
        }
    }

    void show() {
        noStroke();
        fill(0, alpha);
        rect(0, 0, width, height);
    }

    void afterReset() {
        screen.initiate();
        
        fadeIn();
    }
}
