class Button implements Show {
    int h = 50;
    int w = 200;
    float x = width/2 - w/2;
    float y = height/2 - h/2;
    String text = "Button";
    int r = 25; // rounded corner (%)
    int strokeColor = color(255);
    int strokeSize = 4;
    int textWeight = 26;
    color fillColor = color(0);
    color textColor = color(255);
    boolean pressed = false;

    Button() {} // default constructor

    Button(float x, float y, String txt) { // parameterized constructor
        this.x = x;
        this.y = y;
        text = txt;
    }

    boolean mouseInside() {
        return mouseX >= x && mouseX < x + w && mouseY >= y && mouseY < y + h;
    }

    void press() {
        if (mouseInside()) {
            pressed = true;
            fillColor = color(255);
            textColor = color(0);
            strokeSize = 2;
            strokeColor = color(255, 0, 0);
        }
    }

    void release() {
        pressed = false;
        fillColor = color(0);
        textColor = color(255);
        strokeSize = 4;
        strokeColor = color(255);

        if (mouseInside()) trigger();
    }

    void trigger() {
        println("trigger on parent button");
    }

    void show() {
        fill(fillColor);
        stroke(strokeColor);
        strokeWeight(strokeSize);
        rect(x, y, w, h, r);

        textAlign(CENTER, CENTER);
        textSize(textWeight);
        fill(textColor);
        text(text, x + w/2, y + h/2 - 0.4 * textDescent());
    }
}

class ToMenuButton extends Button {
    ToMenuButton(float x, float y, String txt) {
        super(x, y, txt);
    }

    void trigger() {
        //
    }
}

class ToPlayfieldButton extends Button {
    ToPlayfieldButton(float x, float y, String txt) {
        super(x, y, txt);
    }

    void trigger() {
        inputLock = true;

        new FadeOutInScreen(new Playfield()).fadeOut();
    }  
}

class ToEditorButton extends Button {
    ToEditorButton(float x, float y, String txt) {
        super(x, y, txt);
    }

    void trigger() {
        // engine.reset = true;
        
    }
}

class SequenceStartButton extends Button {
    Sequencer sequencer;
    Sequence sequence;

    SequenceStartButton(float x, float y, String txt, Sequencer sequencer, Sequence sequence) {
        super(x, y, txt);
        this.sequencer = sequencer;
        this.sequence = sequence;

    }

    void trigger() {
        if (!sequencer.running) {
            sequencer.setSequence(sequence);
            sequencer.start();
        }
    }
}
