//Conway's Game of Life UI || Andrew Rogan || 11/11/25
boolean mk;
void setupUI() {
  mk = true;
  textMode(CENTER);
  //size(1000,800);
  strokeWeight(4);
  textSize(100);
  stroke(220);
}

void drawUI() {
  strokeWeight(4);
  if (mk == true) {
    stroke(0);
    fill(220);
    text("SIMULATION",257,400);
    text("DISPLAY",325,500);
    line(50,125,50,675);
    line(125,750,875,750); 
    rect(1200,0,400,800);
    fill(220);
    textSize(10);
    text("Conway's Game of Life", 800,775);
    textSize(100);  
    stroke(220);
    rect(1250,50,25,25);
    rect(1250,100,25,25);
    rect(1250,150,25,25);
    line(50,125,50,675);
    line(125,750,575,750);
    
  }
}

void UIonMouseClick(){
  print("Clicked on UI!");
}
