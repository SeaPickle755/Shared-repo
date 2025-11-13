// (c) Andrew Yenchek 2025
class Cell{
Boolean isOccupied;
// position in pixels not cells
float x, y;
Cell(float x, float y, Boolean doesStartOccupied){
  this.x = x;
  this.y= y;
  isOccupied = doesStartOccupied;
  
}
void draw(){
  if(isOccupied)
    fill(255, 0, 0);
  else
    fill(0, 0, 0);
  rect(x, y, CELLSIZE, CELLSIZE);
}
void update(){

}

};
