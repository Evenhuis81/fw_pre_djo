import java.util.Arrays;

Engine engine;
Spark spark;
int backgroundColor = 0;

void setup() {
    size(800, 600);

    engine = new Engine();
    spark = new Spark(width/2, height);

    spark.vel.y = -10; // launchSpeed
    spark.acc.y = 0.1; // gravity
    spark.setLauncher(true);


    engine.addUpdate(spark);
    engine.addShow(spark);
}

void draw() {
    background(backgroundColor);

    engine.update();
    engine.draw();
}
