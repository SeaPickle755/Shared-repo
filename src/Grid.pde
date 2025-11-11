//Grid Class | Alex Zheng

class Grid {
  int siZe = 10;

  Grid() {
    // for loop u wanted mr yencheck if i spelt that right
    for (int x = 0; x < width; x += siZe) {
      for (int y = 0; y < height; y += siZe) {
        new Cell(x, y, siZe);
      }
    }
  }
}
