class Screen {
    void mousePress() {
        println("mousePressed screen");
    }

    void mouseRelease() {
        println("mouseReleased screen");
    }

    void keyPress() {
        println("keyPressed screen");
    }

    void keyRelease() {
        println("keyReleased screen");
    }

    void initiate() {
        println("initiate screen");
    }
}

class Menu extends Screen {
    Button[] buttons;

    Menu() {
        buttons = new Button[2];
        buttons[0] = new ToPlayfieldButton(width/2, height/2, "Playfield");
        buttons[1] = new ToEditorButton(width/2, height/2 + 80, "Editor");
    }

    void mousePress() {
        for (Button b : buttons) b.press();
    }

    void mouseRelease() {
        for (Button b : buttons) b.release();
    }

    void initiate() {
        engine.addShow(buttons[0]);
        engine.addShow(buttons[1]);
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
    }

    void mousePress() {
        for (Button b : buttons) b.press();
    }

    void mouseRelease() {
        for (Button b : buttons) b.release();
    }

    void initiate() {
        engine.addShow(buttons);
    }
}

class Editor extends Screen {
    Button[] buttons;
    ShowTitle showTitle;

    Editor() {
        buttons = new Button[1];
        buttons[0] = new ToMenuButton(50, 50, "Back To Menu");

        showTitle = new ShowTitle("Editor Screen");
    }

    void mousePress() {
        for (Button b : buttons) b.press();
    }

    void mouseRelease() {
        for (Button b : buttons) b.release();
    }

    void initiate() {
        engine.addShow(buttons[0]);
        engine.addShow(showTitle);
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
