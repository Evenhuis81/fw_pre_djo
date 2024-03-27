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
        // 2nd condition is a security check
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
        for (int i = 0; i < elements.length; i++) { // pos, launchSpeed, angle, radius, colors
            elements[i] = new Aerial(new PVector(width/2, height + 15), 8 + i * 0.3, PI * (1.25 + i * 0.05), 15, 255, 0, 0, 175);
        }
    }

    void start(int index) {
        engine.addUpdate(elements[index]);
        engine.addShow(elements[index]);
    }
}
