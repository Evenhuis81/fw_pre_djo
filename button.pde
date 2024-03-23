class Button implements Show {
    float x = width/2;
    float y = height/2;
    String text;
    int h = 50;
    int w = 200;
    int r = 25; // rounded corner (%)
    int strokeColor = 255;
    int strokeSize = 4;

    Button() { // default constructor (= default button)
        //
    }

    Button(float x, float y, String txt) { // parameterized constructor (overload1: position only)
        this.x = x;
        this.y = y;
        text = txt;
    }

    boolean inside() {
        return mouseX >= x && mouseX < x + w && mouseY >= y && mouseY < y + h;
    }

    void show() {
        noFill();
        stroke(strokeColor);
        strokeWeight(strokeSize);
        rect(x, y, w, h, r);

        textAlign(CENTER, CENTER);
        textSize(26);
        fill(255);
        text(text, x + w/2, y + h/2 - 0.4 * textDescent());
    }
}
