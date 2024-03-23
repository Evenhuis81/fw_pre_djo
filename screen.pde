class Menu implements Screen {
    ArrayList<Button> buttons = new ArrayList<Button>();

    Menu(BUtton[] buttons) {
        this.buttons.addAll(Array.asList(buttons));
    }

    void update() {
        //
    }

    void draw() {
        //
    }
}

class Playfield implements Screen {
    ArrayList<Button> buttons = new ArrayList<Button>();
    Sequencer sequencer;
    Sequence sequence1;
    Button startButton;

    Menu(BUtton[] buttons) { // functions as a setup (like main)
        this.buttons.addAll(Array.asList(buttons));

        sequencer = new Sequencer();

        startButton = new Button(width/2, height/2, "Start Sequence 1"); // default constructor
    }

    // engine.update();
    // engine.draw();

    // engine.showStatistics();

    void update() {
        startButton.show(); // temporarily, add this to screen (next story);
    }

    void draw() {
        //
    }
}