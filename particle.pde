class Particle implements Update {
    PVector pos, vel, acc;

    Particle() {
        pos = new PVector();
        vel = new PVector();
        acc = new PVector();
    }

    void update() {
        vel.add(acc);
        pos.add(vel);
    }
}
