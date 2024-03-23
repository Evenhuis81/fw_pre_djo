class Spark extends Particle implements Show {
    int radius, red, green, blue, alpha;

    Spark() {}

    Spark(float x, float y, int radius, int red, int green, int blue) {
        pos.set(x, y);
        this.radius = radius;
        this.red = red;
        this.green = green;
        this.blue = blue;
        alpha = 255;
    }
    
    void show() {
        fill(red, green, blue, alpha);
        circle(pos.x, pos.y, radius * 2);
    }
}

class SparkFade extends Spark {
    SparkFade(float x, float y, int radius, int red, int green, int blue) {
        super(x, y, radius, red, green, blue);
    }

    void update() {
        super.update();

        alpha -= 3;

        if (alpha < 1) {
            engine.removeUpdate(this);
            engine.removeShow(this);
        }
    }
}
