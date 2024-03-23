import java.util.Arrays;

Engine engine;
Sequencer sequencer;
Sequence sequence1;
int backgroundColor = 0;

void setup() {
    size(800, 600);

    engine = new Engine();
    
    sequencer = new Sequencer();
}

void draw() {
    background(backgroundColor);

    engine.update();
    engine.draw();

    engine.showStatistics();
}

color randomColor() {
    // possibly add alpha
    return color(random(256), random(256), random(256));
}
