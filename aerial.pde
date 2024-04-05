class Aerial extends Spark implements AfterRemove {
    boolean exploded = false;
    float launchSpeed;
    PVector startPos;

    Aerial(PVector startPos, float launchSpeed, int radius, int red, int green, int blue, int alpha) {
        super(startPos, radius, red, green, blue, alpha);
        this.startPos = new PVector(startPos.x, startPos.y);
        this.launchSpeed = launchSpeed;
        acc.y = 0.1; // gravity (heavier than exploding sparks)
    }

    void update() {
        super.update();

        // TODO::make this a dynamic condition (fuse-like)
        if (vel.y > 0 && !exploded) {

            explode(30);

            exploded = true;

            engine.removeUpdateAndShow(this, this, this); // update, show, afterRemove
        }
    }

    void afterRemove() {
        exploded = false;
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
