class Spark extends Particle implements Show {
    color strokeColor, fillColor;
    int radius, strokeSize;

    Spark(float x, float y, color strokeColor, color fillColor, int radius, int strokeSize) {
        pos.set(x, y);
        this.strokeColor = strokeColor;
        this.fillColor = fillColor;
        this.radius = radius;
        this.strokeSize = strokeSize;
    }
    
    void show() {
        stroke(strokeColor);
        strokeWeight(strokeSize);
        fill(fillColor);
        circle(pos.x, pos.y, radius * 2);
    }
}
