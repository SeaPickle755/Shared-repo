//Grid Class | Alex Zheng | WORK IN PROGRESS

class Grid {
  int cellSize = 10;

  Grid() {
    // for loop that d
    for (int x = 0; x < width; x += cellSize) {
      for (int y = 0; y < height; y += cellSize) {
        new Cell(x, y, cellSize);
      }
    }
  }
}
