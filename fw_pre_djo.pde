Particle particle;

void setup() {
    size(800, 600);

    particle = new Particle(width/2, height/2);
}

void draw() {
    background(0);

    particle.update();
    particle.show();
}
