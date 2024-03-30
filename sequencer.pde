class Sequencer implements Update, Start {
    Sequence sequence;
    float lastTime, timePassed;
    int index = 0;
    boolean running = false;

    Sequencer(Sequence sequence) {
        this.sequence = sequence;
    }

    void update() {
        timePassed += millis() - lastTime;

        lastTime = millis();

        if (timePassed > sequence.timeStamps[index]) {
            sequence.start(index);

            index++;

            if (index > sequence.elements.length - 1) {
                index = 0;

                running = false; // fireworks might still be displayed

                engine.removeUpdate(this);
            }
        }
    }

    void start() {
        if (!running && sequence.elements.length > 0) {
            running = true;

            lastTime = millis();

            timePassed = 0;

            engine.addUpdate(this);
        }
    }
}

class Sequence {
    Aerial[] elements;
    float[] timeStamps;
    float[] angles;

    void start(int index) {
        elements[index].vel.set(PVector.fromAngle(angles[index]).mult(elements[index].launchSpeed));

        engine.addUpdate(elements[index]);
        engine.addShow(elements[index]);
    }
}

class SeqExample extends Sequence {
    SeqExample(int red, int green, int blue, int alpha) {
        elements = new Aerial[11];
        timeStamps = new float[11];
        angles = new float[11];

        for (int i = 0; i < 11; i++) { // pos, launchSpeed, radius, colors
            elements[i] = new Aerial(new PVector(width/2, height + 15), 8, 15, red, green, blue, alpha);
            angles[i] = PI * (1.4 + i * 0.02);
            timeStamps[i] = i * 100;
        }
    }
}
