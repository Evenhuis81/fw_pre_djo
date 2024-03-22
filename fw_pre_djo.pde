Engine engine;
Particle particle;

void setup() {
    size(800, 600);

    engine = new Engine();
    particle = new Particle(width/2, height/2);

    addParticleToEngineShowAndUpdate(particle);
}

void addParticleToEngineShowAndUpdate(Particle particle) {
    engine.addUpdate(particle);
    engine.addShow(particle);
}

void removeParticleFromEngineShowAndUpdate(Particle particle) {
    engine.removeUpdate(particle);
    engine.removeShow(particle);
}

int count = 0;
boolean removed = false;

void draw() {
    background(0);


    engine.update();
    engine.draw();

    count++;

    if (count > 20 && !removed) {
        println("removed update");

        removeParticleFromEngineShowAndUpdate(particle);
        
        removed = true;
    }

    if (count > 40) {
        addParticleToEngineShowAndUpdate(particle);

        count = 0;
        removed = false;
    }
}
