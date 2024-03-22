class Particle implements Update, Show {
    PVector pos, vel, acc;
    int radius, strokeRed, strokeGreen, strokeBlue, strokeAlpha, fillRed, fillGreen, fillBlue, fillAlpha;

    Particle(float x, float y) {
        pos = new PVector(x, y);
        vel = new PVector();
        acc = new PVector();
        radius = 15;
        strokeRed = 255;
        strokeGreen = 0;
        strokeBlue = 0;
        strokeAlpha = 255;
        fillRed = 0;
        fillGreen = 255;
        fillBlue = 0;
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
