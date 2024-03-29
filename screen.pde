class Screen {
    void mousePress() {
        println("mousePressed");
    }

    void mouseRelease() {
        println("mouseReleased");
    }

    void keyPress() {
        println("keyPressed");
    }

    void keyRelease() {
        println("keyReleased");
    }

    void resetDone() {
        println("resetDone triggered");
    }
}

class Menu extends Screen {
    Button[] buttons = new Button[2];

    Menu() {
        buttons[0] = new ToPlayfieldButton(width/2, height/2, "Playfield");
        buttons[1] = new ToEditorButton(width/2, height/2 + 80, "Editor");

        engine.addShow(buttons[0]);
        engine.addShow(buttons[1]);
    }

    void mousePress() {
        for (Button b : buttons) b.press();
    }

    void mouseRelease() {
        for (Button b : buttons) b.release();
    }

    void resetDone() {
        screen = new Playfield();
    }
}

class Playfield extends Screen {
    Sequencer sequencer;
    Button[] buttons;

    Playfield() { // functions as a setup()
        sequencer = new Sequencer();
        Sequence sequence1 = new Sequence(255, 0, 0, 175);
        Sequence sequence2 = new Sequence(0, 255, 0, 175);
        Sequence sequence3 = new Sequence(0, 0, 255, 175);

        buttons = new Button[4];
        buttons[0] = new SequenceStartButton(width/2, height/2 - 80, "Start Sequence 1", sequencer, sequence1);
        buttons[1] = new SequenceStartButton(width/2, height/2, "Start Sequence 2", sequencer, sequence2);
        buttons[2] = new SequenceStartButton(width/2, height/2 + 80, "Start Sequence 3", sequencer, sequence3);
        buttons[3] = new ToMenuButton(50, 50, "Back To Menu");

        engine.addShow(buttons);
    }

    void mousePress() {
        for (Button b : buttons) b.press();
    }

    void mouseRelease() {
        for (Button b : buttons) b.release();
    }

    void resetDone() {
        screen = new Menu();
    }
}

class Editor extends Screen {
    Button[] buttons = new Button[1];

    Editor() {
        buttons[0] = new ToMenuButton(50, 50, "Back To Menu");

        engine.addShow(buttons[0]);

        ShowTitle showTitle = new ShowTitle("Editor Screen");

        engine.addShow(showTitle);
    }

    void mousePress() {
        for (Button b : buttons) b.press();
    }

    void mouseRelease() {
        for (Button b : buttons) b.release();
    }
}

class ShowTitle implements Show {
    String title;
    float yPos = 100;

    ShowTitle(String title) {
        this.title = title;
    }

    void show() {
        textAlign(CENTER);
        textSize(40);
        fill(255);
        text(title, width/2, yPos);
    }
}


class FadeOutToNewScreen implements Update, Show {
    int alpha = 0;
    int speed = 3;

    FadeOutToNewScreen() {
        engine.addShow(this);
        engine.addUpdate(this);
    }

    void update() {
        alpha += speed;

        if (alpha > 255) {
            engine.reset = true;
        }
    }

    void show() {
        noStroke();
        fill(0, alpha);
        rect(0, 0, width, height);
    }
}
