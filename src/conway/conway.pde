// Whole group credits
static float CELLSIZE = 16.f; // make the cell size be 16

Cell cellTest;
Grid mainGrid;
void setup(){
  textMode(CENTER);
  size(1000,800);
  strokeWeight(4);
  textSize(100);
  setupUI();
  cellTest = new Cell(0.f, 0.f, true);
  mainGrid = new Grid();
}
void draw(){
  background(128);
  drawUI();
  mainGrid.display();
  //cellTest.draw();
}
