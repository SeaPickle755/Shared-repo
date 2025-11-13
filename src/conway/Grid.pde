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
        Cell c = new Cell(x, y, false);
        col.add(c);
      }

      // add column to grid
      cells.add(col);
    }
  }
}
