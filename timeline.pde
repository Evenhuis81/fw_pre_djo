class TimeLine implements Update, Show {
    PVector pos;
    float w = 600;
    float h = 50;
    float min = 0;
    float max = 1000;
    float steps = 10;
    float step = w / steps;

    TimeLine() {
        pos = new PVector(width/2 - w/2, height/2 - h/2);
    }

    void update() {}

    void show() {
        // box
        noFill();
        strokeWeight(1);
        stroke(100);
        rect(pos.x, pos.y, w, h);

        // timeline
        stroke(255);
        line(pos.x, pos.y + h * 0.25, pos.x, pos.y + h * 0.75);
        line(pos.x, pos.y + h/2, pos.x + w, pos.y + h/2);
        line(pos.x + w, pos.y + h * 0.25, pos.x + w, pos.y + h * 0.75);
        
        for (int i = 1; i < 10; i++) {
            line(pos.x + i * step, pos.y + h * 0.4, pos.x + i * step, pos.y + h * 0.6);
        }

        if (mouseInside()) {
            stroke(0, 0, 255);
            fill(0);
            rect(mouseX - 30, mouseY - 35, 60, 30);

            textAlign(CENTER, CENTER);
            textSize(16);
            fill(255);
            text("1000ms", pos.x + w/2, pos.y + h/2 - 0.4 * textDescent());
        }
    }

    boolean mouseInside() {
        return mouseX >= pos.x && mouseX < pos.x + w && mouseY >= pos.y && mouseY < pos.y + h;
    }
}
