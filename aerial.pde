class Aerial extends Spark {
    boolean exploded = false;
    PVector startPos;

    Aerial(PVector startPos, float launchSpeed, float angle, int radius, int red, int green, int blue, int alpha) {
        super(startPos, radius, red, green, blue, alpha);
        pos.set(startPos);
        this.startPos = new PVector(startPos.x, startPos.y);
        vel.set(PVector.fromAngle(angle).mult(launchSpeed));
        acc.y = 0.1; // gravity (heavier than exploding sparks)
    }

    void update() {
        super.update();

        // make this a dynamic condition (fuse-like)
        if (vel.y > 0 && !exploded) {

            explode(30);

            exploded = true;

            pos.set(startPos);
            engine.removeUpdate(this);
            engine.removeShow(this);
        }
    }

    void explode(int amount) {
        Spark[] sparks = new SparkFade[amount];

        for (int i = 0; i < sparks.length; i++) {
            sparks[i] = new SparkFade(pos, 3, 10, red, green, blue, 255);
            sparks[i].vel.set(PVector.random2D().mult(5));
            sparks[i].acc.y = 0.05;
        }

        engine.addUpdate(sparks);
        engine.addShow(sparks);
    }
}
