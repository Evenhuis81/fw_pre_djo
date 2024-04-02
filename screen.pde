class Screen {
    Button[] buttons;

    void mousePress() {
        for (Button b : buttons) b.press();
    }

    void mouseRelease() {
        for (Button b : buttons) b.release();
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
    Menu() {
        buttons = new Button[2];
        buttons[0] = new ToPlayfieldButton(width/2, height/2, "Playfield");
        buttons[1] = new ToEditorButton(width/2, height/2 + 80, "Editor");
    }

    void initiate() {
        engine.addShow(buttons[0]);
        engine.addShow(buttons[1]);
    }
}

class Playfield extends Screen {
    Playfield() { // functions as a setup()
        buttons = new Button[7];
        buttons[0] = new SequenceStartButton(width/2, height/2 - 240, "Start Sequence 1", new Sequencer(new SeqExample(255, 0, 0, 175)));
        buttons[1] = new SequenceStartButton(width/2, height/2 - 160, "Start Sequence 2", new Sequencer(new SeqExample2(0, 255, 0, 175)));
        buttons[2] = new SequenceStartButton(width/2, height/2 - 80, "Start Sequence 3", new Sequencer(new SeqExample3(0, 0, 255, 175)));
        buttons[3] = new SequenceStartButton(width/2, height/2, "Start Sequence 4", new Sequencer(new SeqExample4(0, 255, 255, 175)));
        buttons[4] = new SequenceStartButton(width/2, height/2 + 80, "Start Sequence 5", new Sequencer(new SeqExample5(255, 0, 255, 175)));
        buttons[5] = new SequenceStartButton(width/2, height/2 + 160, "Start Sequence 6", new Sequencer(new SeqExample6(255, 255, 0, 175)));
        buttons[6] = new ToMenuButton(50, 50, "Back To Menu");
    }

    void initiate() {
        engine.addShow(buttons);
    }
}

class Editor extends Screen {
    ShowTitle showTitle;
    TimeLine timeLine;
    boolean timeLineActive = false;

    Editor() {
        buttons = new Button[2];
        buttons[0] = new ToMenuButton(50, 50, "<-");
        buttons[1] = new Create(75, height/2, "Create New", this);

        showTitle = new ShowTitle("Editor Screen");
    }

    void initiate() {
        engine.addShow(buttons);
        engine.addShow(showTitle);
    }

    void create() {
        float w = width/2;
        float h = w/12;
        timeLine = new TimeLine(width/2 - w/2, height/2 - h/2, w, 0, 1000, 10);
        timeLineActive = true;

        engine.addUpdate(timeLine);
        engine.addShow(timeLine);
    }

    void mouseRelease() {
        super.mouseRelease();

        if (timeLineActive && timeLine.mouseInside()) timeLine.setTimer();
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
        fill(255, 100, 0);
        text(title, width/2, yPos);
    }
}
