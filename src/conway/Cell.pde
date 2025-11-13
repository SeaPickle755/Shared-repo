// (c) Andrew Yenchek 2025
class Cell {
  Boolean isOccupied;
  // position in pixels not cells
  float x, y;
  Cell(float x, float y, Boolean doesStartOccupied) {
    this.x = x;
    this.y= y;
    isOccupied = doesStartOccupied;
  }
  void draw() {
    strokeWeight(0);
    if (isOccupied)
      fill(255, 0, 0);
    else
      fill(0, 0, 0);
    rect(x, y, CELLSIZE, CELLSIZE);
  }
  // arguments:
  // neighbors is a 8 list of the neighbors surrounding it
  void update(Boolean[] neighbors) {
    int listLength = neighbors.length;
    int numOccupied = 0;
    for(int i = 0; i < listLength; i++){
      if(neighbors[i]){
        numOccupied++;
      }
    }
    if(numOccupied<=1){ // cell dies
      isOccupied = false;
    }
    else if(numOccupied == 2&&isOccupied){
      isOccupied=true;
    }
    else if(numOccupied==3){
      isOccupied = true;
    }
    else{ // more than 4
      isOccupied = false;
    }
    
  }
};
