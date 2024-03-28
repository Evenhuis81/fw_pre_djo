class DefaultScreen implements Screen {
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
}

class Playfield extends DefaultScreen {
    Sequencer sequencer;
    Button startButton, startButton2;

    Playfield() { // functions as a setup()
        startButton = new Button(width/2, height/2, "Start Sequence 1");
        startButton2 = new Button(width/2, height/2 + 80, "Start Sequence 2");

        engine.addShow(startButton);

        sequencer = new Sequencer();
    }

    void keyRelease() {
        if (key == 1 && !sequencer.running) {
            sequencer.setSequence(new Sequence());
            sequencer.start();
        }
    }

    void mouseRelease() {
        if (startButton.inside(mouseX, mouseY) && !sequencer.running) {
            sequencer.setSequence(new Sequence());
            sequencer.start();
        }
    }
}

class Menu extends DefaultScreen {
    Button[] buttons = new Button[2];

    Menu() {
        buttons[0] = new GoToMenuButton(width/2, height/2, "Back To Menu");
        buttons[1] = new GoToSequencerButton(width/2, height/2 + 80, "Sequencer");

        engine.addShow(buttons[0]);
        engine.addShow(buttons[1]);
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
        text("Updates: " + updates.size(), 0, 60);
    }
}

class Editor extends DefaultScreen {
    // Button[] buttons = new Button[2];

    Editor() {
        // buttons[0] = new GoToMenuButton(width/2, height/2, "Back To Menu");
        // buttons[1] = new GoToSequencerButton(width/2, height/2 + 80, "Sequencer");

        // engine.addShow(buttons[0]);
        // engine.addShow(buttons[1]);

        ShowTitle showTitle = new ShowTitle("Editor Screen");

        engine.addShow(ShowTitle);

    }

    // void mousePress() {
    //     for (Button b : buttons) b.press();
    // }

    // void mouseRelease() {
    //     for (Button b : buttons) b.release();
    // }
}