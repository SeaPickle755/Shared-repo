// Whole group credits
UI ui = new UI();
// trying to change these will throw an error!
static float CELLSIZE = 16.f; // make the cell size be 16
static float UISTARTX = 1250; // the 


Cell cellTest;
Grid mainGrid;
int cellCounter = 0;
// this is temporary
int speed = 5;
Boolean shouldUIbeVisible = false;
void setup(){
  textMode(CENTER);
  // WARNING: Both sides need to be divisible by 16 to avoid cutting off cells
  size(1600, 800);
  strokeWeight(4);
  textSize(100);
  ui.setupUI();
  mainGrid = new Grid();
}

void keyPressed()
{
  // 32 is space
  if(keyCode == 32 && shouldUIbeVisible){
    shouldUIbeVisible = false;
    return;
  }
  if(keyCode == 32 ){
    shouldUIbeVisible = true;
  }
  // ALL THIS CODE IS TEMPORARY
  // 80 is p
  if(keyCode == 80 && speed != 0){
    speed = 0;
    return;
  }
  if(keyCode == 80 ){
    speed = 5;
  }
  // DELETE
}

void mousePressed(){
  if(shouldUIbeVisible){
    if(mouseX > UISTARTX){
      ui.UIonMouseClick();
    }
  } 
   mainGrid.mousePress();
}
void draw(){
  background(128);
  mainGrid.display();
  if(shouldUIbeVisible)
    ui.drawUI();
  cellCounter ++;
  if(cellCounter >= speed && speed != 0){
    mainGrid.update();
    cellCounter = 0;  
  }
  //cellTest.draw();
}
