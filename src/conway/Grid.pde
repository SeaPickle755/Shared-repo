//Grid Class | Alex Zheng | WORK IN PROGRESS
// use CELLSIZE constant from conway.pde!
class Grid {

  Grid() {
    // for loop that d
    for (int x = 0; x < width; x += cellSize) {// use CELLSIZE constant from conway.pde!
      for (int y = 0; y < height; y += cellSize) {// use CELLSIZE constant from conway.pde!
        new Cell(x, y, cellSize);// use CELLSIZE constant from conway.pde!
      }
    }
  }
}
