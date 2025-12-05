//Conway's Game of Life UI || Andrew Rogan || 11/11/25
class UI {
  Slider sliderSpeed = new Slider(1250, 100, 300, 25, false, true);
  boolean mk, clicked;
  UI() {
  }
  void setupUI() {
    clicked=false;
    mk = true;
    textMode(CENTER);
    //size(1000,800);
    strokeWeight(4);
    textSize(100);
    stroke(220);
  }

  void drawUI() {

    if (mk == true) {
      stroke(0);
      fill(220);
      rect(1200, 0, 400, 800);
      fill(220);
      textSize(10);
      text("Conway's Game of Life", 800, 775);
      textSize(100);
      stroke(220);
      rect(1250, 50, 25, 25);
      rect(1250, 100, 25, 25);
      rect(1250, 150, 25, 25);

      strokeWeight(4);
      sliderSpeed.update();
      sliderSpeed.display();
      sliderSpeed.hover();
      sliderSpeed.getValue(0, 10);
      fill(0);
      textSize(20);
      text(str(sliderSpeed.getValue(0, 10)), 1250, 150);
      text("Population: " + str(mainGrid.getPopulation()),1300,725);
      fill(255);
    }
  } 
  int getSpeed(){
    return (int)sliderSpeed.getValue(0, 10);
  }
  void UIonMouseClick() {
    clicked=true;
    print("Clicked on UI!");
  }
  void UIonMouseRelease() {
    clicked=false;
  }
}
