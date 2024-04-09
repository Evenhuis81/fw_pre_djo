class Sequencer implements Update, Start {
    Sequence sequence;
    float lastTime, timePassed;
    boolean running = false;
    int index = 0;

    Sequencer(Sequence sequence) {
        this.sequence = sequence;
    }

    void update() {
        timePassed += millis() - lastTime;

        lastTime = millis();

        if (timePassed > sequence.times[index]) {
            sequence.start(index);

            index++;

            if (index > sequence.times.length - 1) {
                index = 0;

                running = false; // fireworks might still be displayed

                engine.removeUpdate(this);
            }
        }
    }

    void start() {
        if (!running && sequence.times.length > 0) {
            running = true;

            lastTime = millis();

            timePassed = 0;

            engine.addUpdate(this);
        }
    }
}

class Sequence {
    float[] times;

    void start(int index) {
        println("Start with index: " + index + " triggered on parent class.");
    };
}

class FireworksSequence extends Sequence {
    Aerial[] elements;
    // float[] times;
    float[] angles;

    void start(int index) {
        elements[index].pos.set(elements[index].startPos);
        elements[index].vel.set(PVector.fromAngle(angles[index]).mult(elements[index].launchSpeed));

        engine.addUpdate(elements[index]);
        engine.addShow(elements[index]);
    }
}

class SeqExample7 extends FireworksSequence {
    SeqExample7() {
        //
    }
}

class SeqExample extends FireworksSequence {
    SeqExample(int red, int green, int blue, int alpha) {
        elements = new Aerial[11];
        times = new float[11];
        angles = new float[11];

        for (int i = 0; i < 11; i++) { // pos, launchSpeed, radius, colors
            elements[i] = new Aerial(new PVector(width/2, height + 15), 8, 15, red, green, blue, alpha);
            angles[i] = PI * (1.4 + i * 0.02);
            times[i] = i * 100;
        }
    }
}

class SeqExample2 extends FireworksSequence {
    SeqExample2(int red, int green, int blue, int alpha) {
        elements = new Aerial[11];
        times = new float[11];
        angles = new float[11];

        for (int i = 0; i < 11; i++) { // pos, launchSpeed, radius, colors
            elements[i] = new Aerial(new PVector(width/2, height + 15), 8, 15, red, green, blue, alpha);
            angles[i] = PI * (1.6 - i * 0.02);
            times[i] = i * 100;
        }
    }
}

class SeqExample3 extends FireworksSequence {
    SeqExample3(int red, int green, int blue, int alpha) {
        elements = new Aerial[11];
        times = new float[11];
        angles = new float[11];

        for (int i = 0; i < 11; i++) { // pos, launchSpeed, radius, colors
            elements[i] = new Aerial(new PVector(width * 0.25 + (width/2 * i/11) , height + 15), 8, 15, red, green, blue, alpha);
            angles[i] = PI * 1.5;
            times[i] = i * 100;
        }
    }
}

class SeqExample4 extends FireworksSequence {
    SeqExample4(int red, int green, int blue, int alpha) {
        elements = new Aerial[11];
        times = new float[11];
        angles = new float[11];

        for (int i = 0; i < 11; i++) { // pos, launchSpeed, radius, colors
            elements[i] = new Aerial(new PVector(width * 0.75 - (width/2 * i/11) , height + 15), 8, 15, red, green, blue, alpha);
            angles[i] = PI * 1.5;
            times[i] = i * 100;
        }
    }
}

class SeqExample5 extends FireworksSequence {
    SeqExample5(int red, int green, int blue, int alpha) {
        elements = new Aerial[11];
        times = new float[11];
        angles = new float[11];

        for (int i = 0; i < 11; i++) { // pos, launchSpeed, radius, colors
            elements[i] = new Aerial(new PVector(width * 0.25 + (width/2 * i/11) , height + 15), 8, 15, red, green, blue, alpha);
            angles[i] = PI * (1.6 - i * 0.02);
            times[i] = i * 100;
        }
    }
}

class SeqExample6 extends FireworksSequence {
    SeqExample6(int red, int green, int blue, int alpha) {
        elements = new Aerial[11];
        times = new float[11];
        angles = new float[11];

        for (int i = 0; i < 11; i++) { // pos, launchSpeed, radius, colors
            elements[i] = new Aerial(new PVector(width * 0.25 + (width/2 * i/11) , height + 15), 8, 15, red, green, blue, alpha);
            angles[i] = PI * (1.4 + i * 0.02);
            times[i] = i * 100;
        }
    }
}
