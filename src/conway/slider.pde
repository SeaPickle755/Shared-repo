class Slider {
  float x, y, l, tPos, tSize, map;
  boolean v, over, c;
  Slider(float x, float y, float l, float tSize, boolean v, boolean c) {
    this.x=x;
    this.y=y;
    this.l=l;
    this.tSize=tSize;
    this.v=v;
    this.c=c;
    if (v) {
      tPos=y+l;
    } else if (v==false) {
      tPos=x+l;
    }
  }

  void display() {
    if (c) {
      stroke(0);
    }
    if (v) {
      line(x, y, x, y+l);
      line(x-tSize/2, y+l, x+tSize/2, y+l);
      println("Clicked");
    } else if (v==false) {
      line(x, y, x+l, y);
    }
    stroke(255);
  }
  void update() {
    if (c) {
      stroke(0);
    }
    if (over) {
      if (ui.clicked) {
        if (v) {
          tPos=mouseY;
          if (tPos>y+l) {
            tPos=y+l;
          } else if (tPos<y) {
            tPos=y;
          }
        } else if (v==false) {
          tPos=mouseX;
          if (tPos>x+l) {
            tPos=x+l;
          } else if (tPos<x) {
            tPos=x;
          }
        }
      }
    }
    if (v) {
      line(x, y, x, y+l);
      line(x-tSize/2, tPos, x+tSize/2, tPos);
      println("Clicked");
    } else if (v==false) {
      line(x, y, x+l, y);
      line(tPos, y-tSize/2, tPos, y+tSize/2);
    }
    if (c) {
      stroke(255);
    }
  }
  void hover() {
    if (v) {
      if (mouseY>=y&&mouseY<=y+l&&mouseX>=x-tSize/2&&mouseX<=x+tSize/2) {
        over=true;
      } else {
        over=false;
      }
    } else if (v==false) {
      if (mouseX>=x&&mouseX<=x+l&&mouseY>=y-tSize/2&&mouseY<=y+tSize/2) {
        over=true;
        println(str(over));
      } else {
        over=false;
        println(str(over));
      }
    }
  }
  float getValue(int rangeStart, int rangeEnd) {
    return map(tPos, x, x+l, rangeStart, rangeEnd);
  }
}
