import java.util.Arrays;

Engine engine;
int backgroundColor = 0;

void setup() {
    size(800, 600);

    engine = new Engine();
    
    Spark spark = new Spark(width/2, height + 15, color(255, 0, 0), color(0, 255, 0));

    engine.addUpdate(spark);
    engine.addShow(spark);
}

void draw() {
    background(backgroundColor);

    engine.update();
    engine.draw();
}
