class Button {
  float x, y, w, h;
  String label;
  color fillColor;

  Button(float x, float y, float w, float h, String label, color fillColor) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
    this.fillColor = fillColor;
  }

  void display() {
    fill(isHovering() ? lerpColor(fillColor, color(255), 0.2) : fillColor);
    noStroke();
    rect(x, y, w, h, 10);
<<<<<<< HEAD
   fill(textColor);
   textFont(buttonFont);
=======

    fill(fillColor); //BRAXTEN OR WHATEVER HOWEVER YOU SPELL YOUR NAME FIX YOUR CODE\
>>>>>>> dfa45c9e6e40a0c601f0189b70bbc00772362acf
    textAlign(CENTER, CENTER);
    text(label, x + w / 2, y + h / 2);
  }

  boolean isHovering() {
    return mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h;
  }
}
