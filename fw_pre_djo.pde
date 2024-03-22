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
boolean removed = false;

void draw() {
    background(0);

    count++;

    if (count > 60 && !removed) {
        println("removed update");

        engine.removeUpdate(particle);

        engine.removeShow(particle);
        
        removed = true;
    }

    engine.update();

    engine.draw();
}
