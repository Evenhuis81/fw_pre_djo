class Particle implements Update, Show {
    PVector pos, vel, acc;
    int radius, strokeRed, strokeGreen, strokeBlue, strokeAlpha, fillRed, fillGreen, fillBlue, fillAlpha;

    Particle() {}

    Particle(float x, float y) {
        pos = new PVector(x, y);
        vel = new PVector();
        acc = new PVector();
        radius = 15;
        strokeRed = (int) random(256);
        strokeGreen = (int) random(256);
        strokeBlue = (int) random(256);
        strokeAlpha = 255;
        fillRed = (int) random(256);
        fillGreen = (int) random(256);
        fillBlue = (int) random(256);
        fillAlpha = 255;
    }

    void update() {
        vel.add(acc);
        pos.add(vel);
    }

    void show() {
        stroke(strokeRed, strokeGreen, strokeBlue, strokeAlpha);
        fill(fillRed, fillGreen, fillBlue, fillAlpha);
        circle(pos.x, pos.y, radius * 2);
    }
}
