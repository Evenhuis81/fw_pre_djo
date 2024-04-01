class Button extends StrokeFillTextColor implements Show {
    int h = 50;
    int w = 200;
    float x = width/2 - w/2;
    float y = height/2 - h/2;
    String text = "Button";
    int r = 25; // rounded corner (%)
    int strokeSize = 4;
    int textWeight = 26;
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
            strokeSize = 2;
            fillGrayScale(255);
            textGrayScale(0);
            strokeRed = 255;
            strokeGreen = 175;
            strokeBlue = 175;
        }
    }

    void release() {
        pressed = false;

        strokeSize = 4;
        fillGrayScale(0);
        strokeGrayScale(255);
        textGrayScale(255);

        if (mouseInside()) trigger();
    }

    void trigger() {
        println("trigger on parent button");
    }

    void show() {
        fill(fillRed, fillGreen, fillBlue, fillAlpha);
        stroke(strokeRed, strokeGreen, strokeBlue, strokeAlpha);
        strokeWeight(strokeSize);
        rect(x, y, w, h, r);

        textAlign(CENTER, CENTER);
        textSize(textWeight);
        fill(textRed, textGreen, textBlue, textAlpha);
        text(text, x + w/2, y + h/2 - 0.4 * textDescent());
    }
}

class ToMenuButton extends Button {
    ToMenuButton(float x, float y, String txt) {
        super(x, y, txt);
        w = 50;
    }

    void trigger() {
        new FadeOutInScreen(new Menu(), 2, 6); // screen, fadeOut- & fadeInSpeed
    }
}

class ToPlayfieldButton extends Button {
    ToPlayfieldButton(float x, float y, String txt) {
        super(x, y, txt);
    }

    void trigger() {
        new FadeOutInScreen(new Playfield(), 8, 8);
    }  
}

class ToEditorButton extends Button {
    ToEditorButton(float x, float y, String txt) {
        super(x, y, txt);
    }

    void trigger() {
        new FadeOutInScreen(new Editor(), 10, 10);        
    }
}

class SequenceStartButton extends Button {
    Start sequencer;
    SequenceStartButton(float x, float y, String txt, Start sequencer) {
        super(x, y, txt);
        this.sequencer = sequencer;
    }

    void trigger() {
        sequencer.start();
    }
}

class Create extends Button implements Update {
    Editor editor;
    int fadeAlpha = 255;
    int fadeSpeed = -10;
    boolean fading = false;

    Create(float x, float y, String txt, Editor editor) {
        super(x, y, txt);
        this.editor = editor;
    }

    void trigger() {
        fading = true;

        engine.addUpdate(this);
    }

    void update() {
        fadeOut();
    }

    void fadeOut() {
        fadeAlpha += fadeSpeed;

        if (fadeAlpha < 0 && fading) {
            engine.removeUpdate(this);

            fadeAlpha = 0;
            fadeSpeed = 0;

            fading = false;

            editor.create();
        }

        strokeFillTextAlpha(fadeAlpha);
    }
}
