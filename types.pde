interface Update {
    void update();
}

interface Show {
    void show();
}

interface Start {
    void start();
}

interface Sequence {
    void start();
    int getTimeStamp();
}

interface Screen {
    void update();
    void draw();
}

interface Button {
    void show();
    void inside();
}
