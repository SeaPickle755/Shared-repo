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
// Andrew Yenchek
void update() {
    // get size of array
    int R = cells.size();
    int C = cells.get(0).size();
    
    
    int[] offsetR = { -1, -1, -1, 0, 0, 1, 1, 1 }; // Row offsets
    int[] offsetC = { -1, 0, 1, -1, 1, -1, 0, 1 }; // Column offsets
    
    for (int r = 0; r < R; r++) {
        ArrayList<Cell> rowList = cells.get(r);
        for (int c = 0; c < C; c++) {
            Cell current = rowList.get(c);
            Boolean[] neighbors = new Boolean[8];
            
            for (int i = 0; i < 8; i++) {
                int neighbor_r = r + offsetR[i];
                int neighbor_c = c + offsetC[i];

                // make sure you get a index actually in the array
                boolean is_valid = 
                    (neighbor_r >= 0 && neighbor_r < R) &&
                    (neighbor_c >= 0 && neighbor_c < C);

                if (is_valid) {
                    Cell neighborCell = cells.get(neighbor_r).get(neighbor_c);
                    neighbors[i] = neighborCell.getOccupied(); 
                } else {
                    // 4. If outside the grid (invalid), set the state to false
                    neighbors[i] = false;
                }
               
            }
         current.update(neighbors);
        }
    }
}
void mousePress(){
   int cellX = (int)(mouseX/CELLSIZE);
   int cellY = (int)(mouseY/CELLSIZE);
   Cell cellInQuestion = cells.get(cellX).get(cellY);
   cellInQuestion.switchStates();
}
}
