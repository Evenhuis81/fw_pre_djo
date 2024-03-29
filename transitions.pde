
class FadeOutInScreen implements Update, Show, AfterReset {
    Screen newScreen;
    int alpha = 0;
    int speed = 0;

    FadeOutInScreen(Screen screen) {
        newScreen = screen;
    }

    void fadeIn() {
        speed = -3;
        engine.addShow(this);
        engine.addUpdate(this);
    }

    void fadeOut() {
        speed = 3;
        engine.addShow(this);
        engine.addUpdate(this);
    }

    void update() {
        alpha += speed;

        if (alpha > 255) {
            alpha = 255;
            speed = 0;
            screen = newScreen;
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
        println("afterReset");
        screen.initiate();
        fadeIn();
    }
}

// class FadeInNewScreen implements Update, Show {
//     Screen newScreen;
//     int alpha = 255;
//     int speed = 3;

//     FadeInNewScreen(Screen screen) {
//         newScreen = screen;
//         engine.addShow(this);
//         engine.addUpdate(this);
//     }

//     void update() {
//         alpha -= speed;

//         if (alpha < 0) {
//             engine.removeUpdate(this);
//             engine.removeShow(this);
//         }
//     }

//     void show() {
//         noStroke();
//         fill(0, alpha);
//         rect(0, 0, width, height);
//     }
// }
