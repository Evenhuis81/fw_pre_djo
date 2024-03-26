class Spark extends Particle implements Show {
    int radius, red, green, blue, alpha;

    Spark() { // default constructor
        radius = 10;
        red = (int) random(256);
        green = (int) random(256);
        blue = (int) random(256);
        alpha = 255;
    }

    Spark(PVector pos, int radius, int red, int green, int blue, int alpha) { // parameterized constructor
        this.pos.set(pos);
        this.radius = radius;
        this.red = red;
        this.green = green;
        this.blue = blue;
        this.alpha = alpha;
    }
    
    void show() {
        noStroke();
        fill(red, green, blue, alpha);
        circle(pos.x, pos.y, radius * 2);
    }
}

class SparkFade extends Spark {
    float fadeSpeed = 3;

    SparkFade(PVector pos, float fadeSpeed, int radius, int red, int green, int blue, int alpha) {
        super(pos, radius, red, green, blue, alpha);
        this.fadeSpeed = fadeSpeed;
    }

    void update() {
        super.update();

        alpha -= fadeSpeed;

        if (alpha <= 0) {
            engine.removeUpdate(this);
            engine.removeShow(this);
        }
    }
}
