class DefaultButton implements Button, Show {
    int h = 50;
    int w = 200;
    float x = width/2 - w/2;
    float y = height/2 - h/2;
    String text = "Button";
    int r = 25; // rounded corner (%)
    int strokeColor = 255;
    int strokeSize = 4;
    color textColor = color(255);
    boolean pressed = false;

    DefaultButton() {} // default constructor

    DefaultButton(float x, float y, String txt) { // parameterized constructor
        this.x = x;
        this.y = y;
        text = txt;
    }

    boolean inside(float xInc, float yInc) {
        return xInc >= x && xInc < x + w && yInc >= y && yInc < y + h;
    }

    void pressed() {
        if (inside(mouseX, mouseY)) {
            pressed = true;
            textColor = color(255, 0, 0);
        }
    }

    void released() {
        println("button method released triggered");
    }

    void run() {
        println("button method run triggered");
    }

    void show() {
        noFill();
        stroke(strokeColor);
        strokeWeight(strokeSize);
        rect(x, y, w, h, r);

        textAlign(CENTER, CENTER);
        textSize(26);
        fill(textColor);
        text(text, x + w/2, y + h/2 - 0.4 * textDescent());
    }
}


class GoToMenuButton extends DefaultButton {
    GoToMenuButton(float x, float y, String txt) {
        super(x, y, txt);
    }

    void run() {
        println("go to menu button run override abstract method on parent class triggered");
    }  
}
