
class StrokeColor {
    int strokeRed = 255;
    int strokeGreen = 255;
    int strokeBlue = 255;
    int strokeAlpha = 255;

    void strokeGrayScale(int grayScale) {
        strokeRed = grayScale;
        strokeGreen = grayScale;
        strokeBlue = grayScale;
    }
}

class FillColor {
    int fillRed = 0;
    int fillGreen = 0;
    int fillBlue = 0;
    int fillAlpha = 255;

    void fillGrayScale(int grayScale) {
        fillRed = grayScale;
        fillGreen = grayScale;
        fillBlue = grayScale;
    }
}

class TextColor {
    int textRed = 0;
    int textGreen = 0;
    int textBlue = 0;
    int textAlpha = 255;

    void textGrayScale(int grayScale) {
        textRed = grayScale;
        textGreen = grayScale;
        textBlue = grayScale;
    }
}

class StrokeFillTextColor {
    int strokeRed = 255;
    int strokeGreen = 255;
    int strokeBlue = 255;
    int strokeAlpha = 255;
    int fillRed = 0;
    int fillGreen = 0;
    int fillBlue = 0;
    int fillAlpha = 255;
    int textRed = 255;
    int textGreen = 255;
    int textBlue = 255;
    int textAlpha = 255;

    void strokeGrayScale(int grayScale) {
        strokeRed = grayScale;
        strokeGreen = grayScale;
        strokeBlue = grayScale;
    }
    void fillGrayScale(int grayScale) {
        fillRed = grayScale;
        fillGreen = grayScale;
        fillBlue = grayScale;
    }

    void textGrayScale(int grayScale) {
        textRed = grayScale;
        textGreen = grayScale;
        textBlue = grayScale;
    }

    void strokeFillTextAlpha(int newAlpha) {
        strokeAlpha = newAlpha;
        fillAlpha = newAlpha;
        textAlpha = newAlpha;
    }
}
