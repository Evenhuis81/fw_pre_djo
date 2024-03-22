Engine engine;
Particle particle;

void setup() {
    size(800, 600);

    engine = new Engine();
    particle = new Particle(width/2, height/2);

    engine.addUpdate(particle);
    engine.addShow(particle);
}

int count = 0;

void draw() {
    background(0);

    count++;

    if (count > 60) {
        engine.removeUpdate(particle);

        engine.removeShow(particle);
    }

    engine.update();

    engine.draw();
}
