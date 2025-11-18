
// Whole group credits
static float CELLSIZE = 16.f; // make the cell size be 16

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
  setupUI();
  cellTest = new Cell(0.f, 0.f, true);
  mainGrid = new Grid();
}

void keyPressed()
{
  if(keyCode == 32 && shouldUIbeVisible){
    shouldUIbeVisible = false;
    return;
  }
  if(keyCode == 32 ){
    shouldUIbeVisible = true;
  }
}
/*
void keyReleased()
{
  if(keyCode == 32 && shouldUIbeVisible){
    shouldUIbeVisible = false;
  }]
}*/
void draw(){
  background(128);
  mainGrid.display();
  if(shouldUIbeVisible)
    drawUI();
  cellCounter ++;
  if(cellCounter >= speed){
    mainGrid.update();
    cellCounter = 0;  
  }
  //cellTest.draw();
}
