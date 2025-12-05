// Grid Class | Alex Zheng && Andrew Yenchek
// Uses CELLSIZE from conway.pde
// need this for maps and hashmaps.
// used for aliveCells
import java.util.Map;
import java.util.HashMap;
import java.util.HashSet;
class Grid {
  // create list of alive cells only
  HashMap<PVector, Boolean> aliveCells;
  int offsetX, offsetY;
  int scrollX, scrollY;
  Grid() {
    aliveCells = new HashMap<PVector, Boolean>();
    scrollX = 1;
    scrollY = 1;
  }
  int getPopulation(){
    return aliveCells.size();
  }
  void display() {
    int cols = width / (int)CELLSIZE*scrollX;
    int rows = height / (int)CELLSIZE*scrollY;
    if(scrollX != 1){
      noStroke();
    }
    else{
      stroke(0);
    }
    for (int x = 0; x < cols; x++) {
      for (int y = 0; y < rows; y++) {

        PVector key = new PVector(x+offsetX, y+offsetY);

        if (aliveCells.containsKey(key)) {
          fill(255, 0, 0);   // RED – alive
        } else {
          fill(0);           // BLACK – dead
        }
            float cellW = CELLSIZE / scrollX;
    float cellH = CELLSIZE / scrollY;
    boolean drawGrid = cellW >= 4 && cellH >= 4;
    if (drawGrid) stroke(5);
    else noStroke();

    rect(x * cellW, y * cellH, cellW, cellH);
      }
    }
  }
  void scrolled(int scroll) {
  scrollX = max(1, scrollX + scroll);
  scrollY = max(1, scrollY + scroll);
}
  // Andrew Yenchek
  void update() {

    HashSet<PVector> toCheck = new HashSet<PVector>();
    int[] N = { -1, 0, 1 };

    // Collect all relevant cells
    for (PVector p : aliveCells.keySet()) {
      for (int dx : N) {
        for (int dy : N) {
          toCheck.add(new PVector(p.x + dx, p.y + dy));
        }
      }
    }

    // NEW generation
    HashMap<PVector, Boolean> nextGen = new HashMap<PVector, Boolean>();

    for (PVector p : toCheck) {

      int aliveNeighbors = countAliveNeighbors((int)p.x, (int)p.y);
      boolean isAlive = aliveCells.containsKey(p);

      // Conway rules
      if (isAlive && (aliveNeighbors == 2 || aliveNeighbors == 3)) {
        nextGen.put(p, true);
      } else if (!isAlive && aliveNeighbors == 3) {
        nextGen.put(p, true);
      }
    }

    // replace old world
    aliveCells = nextGen;
  }
  int countAliveNeighbors(int cx, int cy) {
    int count = 0;

    // Offsets for the 8 directions
    int[] offsets = { -1, 0, 1 };

    for (int dx : offsets) {
      for (int dy : offsets) {

        // Skip the cell itself
        if (dx == 0 && dy == 0) continue;

        PVector key = new PVector(cx + dx, cy + dy);

        // If the HashMap contains that cell, it's alive
        if (aliveCells.containsKey(key)) {
          count++;
        }
      }
    }

    return count;
  }
  void moveCamera(int dx, int dy) {
    offsetX += dx;
    offsetY += dy;
  }

  // how many alive cells are surrounding it
  Boolean calcCellSim(int numOccupied, Boolean isCellOccupied) {
    boolean isOccupied;
    if (numOccupied<=1) { // cell dies
      isOccupied = false;
    } else if (numOccupied == 2&&isCellOccupied) {
      isOccupied=true;
    } else if (numOccupied==3) {
      isOccupied = true;
    } else { // more than 4
      isOccupied = false;
    }
    return isOccupied;
    }
void mousePress(int size) {

  float cellW = CELLSIZE / (float)scrollX;
  float cellH = CELLSIZE / (float)scrollY;

  int centerX = floor(mouseX / cellW) + offsetX;
  int centerY = floor(mouseY / cellH) + offsetY;

  for (int dx = -size; dx <= size; dx++) {
    for (int dy = -size; dy <= size; dy++) {

      PVector cell = new PVector(centerX + dx, centerY + dy);

      if (aliveCells.containsKey(cell)) {
        aliveCells.remove(cell);
      } else {
        aliveCells.put(cell, true);
      }
    }
  }
}

};
