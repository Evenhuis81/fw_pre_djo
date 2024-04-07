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

class Phase1 implements Sequence {
    /

    void start(int index) {
        //
    };
}

class Sequence1 implements Sequence {
    Aerial[] elements;
    float[] timeStamps;
    float[] angles;

    void start(int index) {
        elements[index].pos.set(elements[index].startPos);
        elements[index].vel.set(PVector.fromAngle(angles[index]).mult(elements[index].launchSpeed));

        engine.addUpdate(elements[index]);
        engine.addShow(elements[index]);
    }
}

class SeqExample extends Sequence1 {
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

class SeqExample2 extends Sequence1 {
    SeqExample2(int red, int green, int blue, int alpha) {
        elements = new Aerial[11];
        timeStamps = new float[11];
        angles = new float[11];

        for (int i = 0; i < 11; i++) { // pos, launchSpeed, radius, colors
            elements[i] = new Aerial(new PVector(width/2, height + 15), 8, 15, red, green, blue, alpha);
            angles[i] = PI * (1.6 - i * 0.02);
            timeStamps[i] = i * 100;
        }
    }
}

class SeqExample3 extends Sequence1 {
    SeqExample3(int red, int green, int blue, int alpha) {
        elements = new Aerial[11];
        timeStamps = new float[11];
        angles = new float[11];

        for (int i = 0; i < 11; i++) { // pos, launchSpeed, radius, colors
            elements[i] = new Aerial(new PVector(width * 0.25 + (width/2 * i/11) , height + 15), 8, 15, red, green, blue, alpha);
            angles[i] = PI * 1.5;
            timeStamps[i] = i * 100;
        }
    }
}

class SeqExample4 extends Sequence1 {
    SeqExample4(int red, int green, int blue, int alpha) {
        elements = new Aerial[11];
        timeStamps = new float[11];
        angles = new float[11];

        for (int i = 0; i < 11; i++) { // pos, launchSpeed, radius, colors
            elements[i] = new Aerial(new PVector(width * 0.75 - (width/2 * i/11) , height + 15), 8, 15, red, green, blue, alpha);
            angles[i] = PI * 1.5;
            timeStamps[i] = i * 100;
        }
    }
}

class SeqExample5 extends Sequence1 {
    SeqExample5(int red, int green, int blue, int alpha) {
        elements = new Aerial[11];
        timeStamps = new float[11];
        angles = new float[11];

        for (int i = 0; i < 11; i++) { // pos, launchSpeed, radius, colors
            elements[i] = new Aerial(new PVector(width * 0.25 + (width/2 * i/11) , height + 15), 8, 15, red, green, blue, alpha);
            angles[i] = PI * (1.6 - i * 0.02);
            timeStamps[i] = i * 100;
        }
    }
}

class SeqExample6 extends Sequence1 {
    SeqExample6(int red, int green, int blue, int alpha) {
        elements = new Aerial[11];
        timeStamps = new float[11];
        angles = new float[11];

        for (int i = 0; i < 11; i++) { // pos, launchSpeed, radius, colors
            elements[i] = new Aerial(new PVector(width * 0.25 + (width/2 * i/11) , height + 15), 8, 15, red, green, blue, alpha);
            angles[i] = PI * (1.4 + i * 0.02);
            timeStamps[i] = i * 100;
        }
    }
}
