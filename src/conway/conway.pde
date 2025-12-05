// Whole group credits
UI ui = new UI();
// trying to change these will throw an error!
static float CELLSIZE = 16.f; // make the cell size be 16
static float UISTARTX = 1250; // the 


Cell cellTest;
Grid mainGrid;
Boolean leftClickDrag = false;
int cellCounter = 11;
int penSize = 0;
// this is temporary
int speed = 1;
Boolean shouldUIbeVisible = false;
int prevMouseX, prevMouseY;
void setup(){
  textMode(CENTER);
  // WARNING: Both sides need to be divisible by 16 to avoid cutting off cells
  size(1600, 800);
  surface.setResizable(true);
  strokeWeight(4);
  textSize(100);
  ui.setupUI();
  mainGrid = new Grid();
  mainGrid.getPopulation();
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
  if(key == 'w'){
    mainGrid.moveCamera(0, -1);
  }else if(key == 's'){
    mainGrid.moveCamera(0, 1);
  }else if(key == 'a')
    mainGrid.moveCamera(-1, 0);
  else if(key == 'd')
    mainGrid.moveCamera(1, 0);
  else if(key == '=' || key == '+')
    penSize++;
  else if(key == '-')
    penSize--;
  // DELETE
}

void mousePressed(){
  if(shouldUIbeVisible){
    if(mouseX > UISTARTX){
      ui.UIonMouseClick();
      return;
    }
  } 
  if(mouseButton != RIGHT)
     mainGrid.mousePress(penSize);
}
void mouseReleased() {
  ui.UIonMouseRelease();
}
void mouseDragged() 
{
  if(mouseButton == LEFT)
    mainGrid.mousePress(penSize);
  if(mouseButton == RIGHT)
    mainGrid.moveCamera((int)(mouseX-pmouseX)/2, (int)(mouseY-pmouseY)/2);
}
void mouseWheel(MouseEvent event){
  mainGrid.scrolled(event.getCount());
}
void draw(){
  background(128);
  mainGrid.display();
  if(shouldUIbeVisible)
    ui.drawUI();
  cellCounter --;
  if(cellCounter <= speed && speed != 0){
    mainGrid.update();
    cellCounter = 11;  
    
  }
  speed = (int)ui.getSpeed();
  //mainGrid.sizeChanged(width, height);
  //cellTest.draw();
  
  
}
