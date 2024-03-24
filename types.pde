interface Update {
    void update();
}

interface Show {
    void show();
}

interface Start {
    void start();
}

interface Screen {
    void mousePress();
    void mouseRelease();
    void keyPress();
    void keyRelease();
}

interface Sequence {
    void start();
}

interface Button {
    boolean inside(float xInc, float yInc);
    void show();
}
