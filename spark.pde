class Spark extends Particle implements Show {
    color strokeColor, fillColor;
    int radius, strokeSize;

    Spark(float x, float y, color strokeColor, color fillColor) {
        pos.set(x, y);
        this.strokeColor = strokeColor;
        this.fillColor = fillColor;
        radius = 15;
        strokeSize = 2;
    }
    
    void show() {
        stroke(strokeColor);
        strokeWeight(strokeSize);
        fill(fillColor);
        circle(pos.x, pos.y, radius * 2);
    }
}
