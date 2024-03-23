void keyReleased() {
    if (key == ' ' && !sequencer.running) {
        startSequencer();
    }
}

void mousePressed() {
    //
}

void mouseReleased() {
    if (startButton.inside() && !sequencer.running) startSequencer();
}

void startSequencer() {
    for (int i = 0; i < 5000; i += 500) {
        Sequence1 seq1 = new Sequence1(i);
        sequencer.addSequence(seq1);
    }

    sequencer.start();
}
