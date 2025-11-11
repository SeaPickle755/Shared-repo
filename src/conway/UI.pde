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
    x=250;
    y=400;
    x2=325;
    y2=500;
    fill(20);
    text(dVal,x,y);
    text(dVal2,x2,y2);
  }
  if (mk == false) {
    x=100;
    y=400;
    x2=125;
    y2=500;
    fill(20);
    text(dVal,x,y);
    text(dVal2,x2,y2);
  }
}
