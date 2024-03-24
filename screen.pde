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
    DefaultButton startButton;

    Playfield() { // functions as a setup (like main)
        startButton = new DefaultButton(width/2, height/2, "Start Sequence 1"); // default constructor

        engine.addShow(startButton);

        sequencer = new Sequencer();

        Sequence1 sequence1 = new Sequence1();

        sequencer.setSequence(sequence1);

    }

    void keyRelease() {
        if (key == ' ' && !sequencer.running) sequencer.start();
    }

    void mouseRelease() {
        if (startButton.inside(mouseX, mouseY) && !sequencer.running) sequencer.start();
    }
}
