class Sequencer implements Update, Start { // Sequence one
    ArrayList<Sequence> sequences = new ArrayList<Sequence>();
    ArrayList<Integer> timeStamps = new ArrayList<Integer>();
    float lastTime, timePassed;
    int index = 0;
    boolean running = false;

    void update() {
        timePassed += millis() - lastTime;

        lastTime = millis();

        if (timePassed > timeStamps.get(index)) {
        sequences.get(index).start();

            index++;

            if (index > sequences.size() - 1) {
                index = 0;
                sequences.clear();
                timeStamps.clear();

                engine.removeUpdate(this);
                running = false;
            }
        }
    }

    void addSequence(Sequence sequence) {
        sequences.add(sequence);
        timeStamps.add(sequence.getTimeStamp());
    }

    void start() {
        if (!running && sequences.size() > 0 && sequences.size() == timeStamps.size()) {
            running = true;
            lastTime = millis();
            timePassed = 0;

            engine.addUpdate(this);
        }
    }
}

class Sequence1 implements Sequence {
    Dahlia dahlia = new Dahlia();
    int timeStamp;

    Sequence1(int timeStart) {
        timeStamp = timeStart;
    }

    void start() {
        engine.addUpdate(dahlia);
        engine.addShow(dahlia);
    }

    int getTimeStamp() {
        return timeStamp;
    }
}
