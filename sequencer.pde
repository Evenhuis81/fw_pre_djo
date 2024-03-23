class Sequencer implements Update { // Sequence one
    Spark launchSpark;
    boolean exploded;

    Sequencer() {
        launchSpark = new Spark(width/2, height + 15, color(255, 0, 0), color(0, 255, 0), 15, 1);

        launchSpark.vel.y = -10;
        launchSpark.acc.y = 0.1;

        engine.addUpdate(this);
    }

    void start() {
        engine.addUpdate(launchSpark);
        engine.addShow(launchSpark);
    }

    void update() {
        if (launchSpark.vel.y > 0 && !exploded) {

            explode(100);

            exploded = true;
            
            engine.removeUpdate(this);

            engine.removeUpdate(launchSpark);
            engine.removeShow(launchSpark);
        }
    }

    void explode(int amount) {
        Spark[] sparks = new Spark[amount];

        for (int i = 0; i < sparks.length; i++) {
            sparks[i] = new Spark(launchSpark.pos.x, launchSpark.pos.y, randomColor(), randomColor(), 10, 4);
            sparks[i].vel.set(PVector.random2D().mult(5));
            sparks[i].acc.y = 0.05;
        }

        engine.addUpdate(sparks);
        engine.addShow(sparks);
    }
}