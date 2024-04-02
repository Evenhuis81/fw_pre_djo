class TimeLine implements Update, Show {
    ArrayList<PVector> timers = new ArrayList<PVector>();
    PVector pos;
    float w, h, min, max, steps, step;

    TimeLine(float x, float y, float width, float minimum, float maximum, float steps) {
        pos = new PVector(x, y);
        w = width;
        h = w/12;
        min = minimum;
        max = maximum;
        this.steps = steps;
        step = w / steps;
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
        line(pos.x, pos.y + h/2, pos.x + w, pos.y + h/2);
        
        for (int i = 1; i < steps; i++) {
            line(pos.x + i * step, pos.y + h * 0.4, pos.x + i * step, pos.y + h * 0.6);
        }

        if (mouseInside()) {
            stroke(0, 0, 255);
            fill(0);
            rect(mouseX - 30, pos.y - 35, 60, 30);

            textAlign(CENTER, CENTER);
            textSize(16);
            fill(255);
            int value = (int) ((mouseX - pos.x) / w * (max - min));
            text(value, mouseX, pos.y - 20 - 0.4 * textDescent());
        }

        for (PVector timer : timers) {
            fill(255, 0, 0, 255);
            noStroke();
            circle(timer.x, timer.y, h/5);
        }
    }

    void setTimer() {
        timers.add(new PVector(mouseX, pos.y + h/2));
    }

    boolean mouseInside() {
        return mouseX >= pos.x && mouseX < pos.x + w && mouseY >= pos.y && mouseY < pos.y + h;
    }
}
