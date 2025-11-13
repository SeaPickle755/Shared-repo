//Grid Class | Alex Zheng | WORK IN PROGRESS
// use CELLSIZE constant from conway.pde!
class Grid {

  Grid() {
    // for loop that d
    for (int x = 0; x < width; x += CELLSIZE) {// use CELLSIZE constant from conway.pde!
      for (int y = 0; y < height; y += CELLSIZE) {// use CELLSIZE constant from conway.pde!
        new Cell(x, y, CELLSIZE);// use CELLSIZE constant from conway.pde!
      }
    }
  }
}
