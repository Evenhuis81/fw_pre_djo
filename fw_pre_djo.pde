import java.util.Arrays;

int backgroundColor = 0;

Engine engine;
Screen screen;

void setup() {
    size(1200, 600);


    // Combine afterRemove update and afterRemove show to 1 function and always apply both at the same time.
    engine = new Engine();

    // screen = new Menu();
    screen = new Editor();

    screen.initiate();
}


void draw() {
    background(backgroundColor);

    engine.update();

    engine.draw();
}
