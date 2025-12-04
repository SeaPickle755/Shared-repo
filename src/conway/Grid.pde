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
  Grid() {
    aliveCells = new HashMap<PVector, Boolean>();
  }
  void display() {
    int cols = width / (int)CELLSIZE;
    int rows = height / (int)CELLSIZE;
    strokeWeight(0);
    for (int x = 0; x < cols; x++) {
      for (int y = 0; y < rows; y++) {

        PVector key = new PVector(x+offsetX, y+offsetY);

        if (aliveCells.containsKey(key)) {
          fill(255, 0, 0);   // RED – alive
        } else {
          fill(0);           // BLACK – dead
        }

        rect(x*CELLSIZE, y*CELLSIZE, CELLSIZE, CELLSIZE);
      }
    }
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
  void mousePress() {
    int cellX = mouseX / (int)CELLSIZE;
    int cellY = mouseY / (int)CELLSIZE;
    cellX += offsetX;
    cellY += offsetY;
    if (aliveCells.containsKey(new PVector(cellX, cellY))) {
      aliveCells.remove(new PVector(cellX, cellY));
    } else {
      aliveCells.put(new PVector(cellX, cellY), true);
    }
  }
};
