import java.util.Arrays;

Engine engine;
Sequencer sequencer;
Sequence sequence1;
int backgroundColor = 0;

Button startButton;

void setup() {
    size(800, 600);

    engine = new Engine();
    
    sequencer = new Sequencer();

    startButton = new Button(width/2, height/2, "Start Sequence 1"); // default constructor
}

void draw() {
    background(backgroundColor);

    engine.update();
    engine.draw();

    engine.showStatistics();

    startButton.show(); // temporarily, add this to screen (next story);
}

