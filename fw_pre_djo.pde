import java.util.Arrays;

Engine engine;
Screen screen;

void setup() {
    size(800, 600);

    engine = new Engine();

    screen = new DefaultScreen();
}

int backgroundColor = 0;

void draw() {
    background(backgroundColor);

    engine.update();

    engine.draw();
}

