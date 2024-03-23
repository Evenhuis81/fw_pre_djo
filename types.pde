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
