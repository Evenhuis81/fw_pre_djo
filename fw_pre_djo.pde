import java.util.Arrays;

Engine engine;
Sequencer sequencer;
int backgroundColor = 0;

void setup() {
    size(800, 600);

    engine = new Engine();
    
    sequencer = new Sequencer();

    sequencer.start();
}

void draw() {
    background(backgroundColor);

    engine.update();
    engine.draw();
}

color randomColor() {
    // possibly add alpha
    return color(random(256), random(256), random(256));
}