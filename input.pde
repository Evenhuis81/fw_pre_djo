boolean inputLock = false;

void mousePressed() {
    if (!inputLock) screen.mousePress();
}

void mouseReleased() {
    if (!inputLock) screen.mouseRelease();
}

void keyPressed() {
    if (!inputLock) screen.keyPress();

    if (key == 't') {
        // engine.showStatistics = !engine.showStatistics;
        engine.switchStatShow();
    }
}

void keyReleased() {
    if (!inputLock) screen.keyRelease();
}
