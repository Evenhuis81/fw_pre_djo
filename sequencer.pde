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
            sequence.start(index);

            index++;

            if (index > sequence.elements.length - 1) {
                engine.removeUpdate(this);
                running = false;
                index = 0;
            }
        }
    }

    void start() {
        if (!running && sequence.elements.length > 0 && sequence.elements.length == sequence.timeStamps.length) {
            lastTime = millis();
            timePassed = 0;

            running = true;
            engine.addUpdate(this);
        }
    }
}

class Sequence {
    Spark[] elements = new Aerial[11];
    int[] timeStamps = { 0, 1000, 1900, 2700, 3400, 4000, 4500, 4900, 5200, 5400, 5500 };

    Sequence() {
        for (int i = 0; i < elements.length; i++) {
            elements[i] = new Aerial();
        }
    }

    void start(int index) {
        engine.addUpdate(elements[index]);
        engine.addShow(elements[index]);
    }
}
