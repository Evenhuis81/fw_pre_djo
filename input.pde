boolean running = false;

void keyReleased() {
    if (key == ' ' && !running) {
        running = true;

        for (int i = 0; i < 5000; i += 500) {
            Sequence1 seq1 = new Sequence1(i);
            sequencer.addSequence(seq1);
        }

        sequencer.start();
    }
}
