import java.util.Arrays;

int backgroundColor = 0;

Statistics statistics;
Engine engine;
Screen screen;

void setup() {
    size(1200, 600);

    engine = new Engine();

    statistics = new Statistics();

    setStatistics();

    screen = new Menu();

    screen.initiate();
}


void draw() {
    background(backgroundColor);

    engine.update();

    engine.draw();
}
