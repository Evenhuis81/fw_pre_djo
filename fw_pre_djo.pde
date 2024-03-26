import java.util.Arrays;

Engine engine;
Screen screen;

void setup() {
    size(1200, 600);

    engine = new Engine();

    screen = new Playfield();
}

int backgroundColor = 0;

void draw() {
    background(backgroundColor);

    engine.update();

    engine.draw();

    engine.showStatistics();
}
