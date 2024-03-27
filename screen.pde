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
    DefaultButton startButton, startButton2;

    Playfield() { // functions as a setup()
        startButton = new DefaultButton(width/2, height/2, "Start Sequence 1");
        startButton2 = new DefaultButton(width/2, height/2 + 80, "Start Sequence 2");

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
    DefaultButton[] buttons = new DefaultButton[2];

    Menu() {
        buttons[0] = new GoToMenuButton(width/2, height/2, "Back To Menu");
        buttons[1] = new DefaultButton(width/2, height/2 + 80, "Sequencer");

        engine.addShow(buttons[0]);
        engine.addShow(buttons[1]);
    }

    void mouseRelease() {
        for (DefaultButton b : buttons) {
            if (b.inside(mouseX, mouseY) && b.pressed) b.run();
        }
    }
}