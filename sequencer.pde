class Sequencer implements Update, Start { // Sequence one
    Sequence sequence;
    float lastTime, timePassed;
    int index = 0;
    boolean running = false;

    Sequencer() {}

    void setSequence(Sequence sequence) {
        this.sequence = sequence;
    }

    void update() {
        timePassed += millis() - lastTime;

        lastTime = millis();

        if (timePassed > sequence.timeStamps[index]) {
            sequence[index].start(index);

            index++;

            if (index > sequence.length - 1) {
                engine.removeUpdate(this);
                running = false;
                index = 0;
            }
        }
    }

    void start() {
        if (!running && sequence.fireworks.length > 0 && sequence.fireworks.length == sequence.timeStamps.length) {
            lastTime = millis();
            timePassed = 0;

            running = true;
            engine.addUpdate(this);
        }
    }
}

class DefaultSequence {
    //
}

class Sequence1 extends DefaultSequence {
    Dahlia[] fireworks = new Dahlia[11];
    int[] timeStamps = { 0, 1000, 1900, 2700, 3400, 4000, 4500, 4900, 5200, 5400, 5500 };

    Sequence1() {
        for (int i = 0; i < fireworks.length; i++) {
            fireworks[i] = new Dahlia();
        }
    }

    void start(int index) {
        engine.addUpdate(fireworks[index]);
        engine.addShow(fireworks[index]);
    }
}
