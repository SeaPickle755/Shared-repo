//Conway's Game of Life UI || Andrew Rogan || 11/11/25
boolean mk;
void setupUI() {
  mk = true;
  textMode(CENTER);
  size(1000,800);
  strokeWeight(4);
  textSize(100);
}

void drawUI() {
  fill(255);
  strokeWeight(4);
  rect(1,1,998,798);
  if (mk == true) {
    fill(20);
    text("SIMULATION",257,400);
    text("DISPLAY",325,500);
    line(50,125,50,675);
    line(125,750,875,750);
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
    textSize(100);  
    fill(250);
    rect(750,50,25,25);
    rect(750,100,25,25);
    rect(750,150,25,25);
    line(50,125,50,675);
    line(125,750,575,750);
    
  }
}

void mousePressed() {
  if(mk) {
    mk=false;
  }else if (mk==false) {
    mk=true;
  }
}
