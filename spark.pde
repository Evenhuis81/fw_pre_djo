class Spark extends Particle {
    boolean exploded = false;
    boolean launcher = false;

    Spark() {
        fillRed = 255;
        fillGreen = 0;
        fillBlue = 0;

        strokeRed = 0;
        strokeGreen = 255;
        strokeBlue = 0;
    }

    Spark(float x, float y) {
        super(x, y);
    }

    void setLauncher(boolean flag) {
        launcher = flag;
    }

    void update() {
        super.update();

        if (launcher && !exploded && vel.y > 0) {
            exploded = true;

            explode(100);

            engine.removeUpdate(this);
            engine.removeShow(this);
        }
    }

    void explode(int amount) {
        Spark[] sparks = new Spark[amount];

        for (int i = 0; i < sparks.length; i++) {
            sparks[i] = new Spark(pos.x, pos.y);
            sparks[i].vel.set(PVector.random2D().mult(3));
            sparks[i].acc.set(-0.02, 0.05);
        }

        engine.addUpdate(sparks);
        engine.addShow(sparks);
    }
}
