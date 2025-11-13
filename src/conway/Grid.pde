// Grid Class | Alex Zheng
// Uses CELLSIZE from conway.pde

class Grid {
  ArrayList<ArrayList<Cell>> cells;

  Grid() {
    cells = new ArrayList<ArrayList<Cell>>();

    // for loop horizontal
    for (int x = 0; x < width; x += CELLSIZE) {
      ArrayList<Cell> col = new ArrayList<Cell>(); // each column

      // for loop vertical
      for (int y = 0; y < height; y += CELLSIZE) {
        Boolean cellStart = true;
        if((int)random(0, 10)%2 == 0)
          ;
        else{
           cellStart = false;
        };
        Cell c = new Cell(x, y, cellStart);
        col.add(c);
      }

      // add column to grid
      cells.add(col);
    }
  }
  void display(){
    for(int x = 0; x < cells.size(); x++){
       ArrayList<Cell> yList = cells.get(x);
       for(int y = 0; y < yList.size(); y++){
         yList.get(y).draw();
       }
    }
  }
};
