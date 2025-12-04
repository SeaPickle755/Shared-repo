class Button {
  float x, y, w, h;
  String label;
  color fillColor;
  color textColor;
  PFont font;
  
  float hoverAmount = 0; // smooth hover animation (0–1)

  Button(float x, float y, float w, float h, String label, 
         color fillColor, color textColor, PFont font) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
    this.fillColor = fillColor;
    this.textColor = textColor;
    this.font = font;
  }

  void display() {
    // smooth hover transition
    if (isHovering()) {
      hoverAmount = lerp(hoverAmount, 1, 0.2);
    } else {
      hoverAmount = lerp(hoverAmount, 0, 0.2);
    }

    // apply hover lightening
    color hoverColor = lerpColor(fillColor, color(255), 0.2 * hoverAmount);

    noStroke();
    fill(hoverColor);
    rect(x, y, w, h, 10);
   fill(fillColor);


    fill(fillColor); //BRAXTEN OR WHATEVER HOWEVER YOU SPELL YOUR NAME FIX YOUR CODE

    fill(textColor);

    textAlign(CENTER, CENTER);
    textFont(font);
    text(label, x + w/2, y + h/2);
  }

  boolean isHovering() {
    return mouseX >= x && mouseX <= x + w &&
           mouseY >= y && mouseY <= y + h;
  }

  boolean isClicked() {
    return isHovering() && mousePressed;
  }
};
