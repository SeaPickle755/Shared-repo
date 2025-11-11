//Conway's Game of Life UI || Andrew Rogan || 11/11/25
boolean mk;
int x, y, x2, y2;
String dVal,dVal2;
void setup() {
  mk = true;
  textMode(CENTER);
  size(1000,800);
  strokeWeight(4);
  textSize(100);
}

void draw() {
  dVal = "SIMULATION";
  dVal2 = "DISPLAY";
  fill(255);
  rect(1,1,998,798);
  if (mk == true) {
    fill(20);
    text("SIMULATION",257,400);
    text("DISPLAY",325,500);
  }
  if (mk == false) {
    fill(20);
    text("SIMULATION",100,400);
    text("DISPLAY",125,500);
    fill(220);
    rect(700,0,300,800);
    fill(0);
    textSize(10);
    text("Conway's Game of Life", 800,775);
    textSize(100);  }
}

void mousePressed() {
  if(mk) {
    mk=false;
  }else if (mk==false) {
    mk=true;
  }
}
