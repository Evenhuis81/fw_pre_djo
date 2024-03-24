class Dahlia extends Spark {
    boolean exploded = false;

    Dahlia() {
        super(width/2, height + 15, 15, (int) random(256), (int) random(256), (int) random(256));
        vel.y = -10; // launchSpeed
        acc.y = 0.1; // gravity (heavier than exploding sparks)
    }

    void update() {
        super.update();

        if (vel.y > 0 && !exploded) {

            explode(30);

            exploded = true;

            engine.removeUpdate(this);
            engine.removeShow(this);
        }
    }

    void explode(int amount) {
        Spark[] sparks = new SparkFade[amount];

        for (int i = 0; i < sparks.length; i++) {
            sparks[i] = new SparkFade(pos.x, pos.y, 10, (int) random(256), (int) random(256), (int) random(256));
            sparks[i].vel.set(PVector.random2D().mult(5));
            sparks[i].acc.y = 0.05;
        }

        engine.addUpdate(sparks);
        engine.addShow(sparks);
    }
}
