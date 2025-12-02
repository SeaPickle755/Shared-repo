class Slider {
  float x, y, l, tPos, tSize;
  boolean v, over;
  Slider(float x, float y, float l, float tSize, boolean v) {
    this.x=x;
    this.y=y;
    this.l=l;
    this.tSize=tSize;
    this.v=v;
    if (v) {
      tPos=y+l;
    } else if (v==false) {
      tPos=x+l;
    }
  }
  void display() {
    if (v) {
      line(x, y, x, y+l);
      line(x-tSize/2, y+l, x+tSize/2, y+l);
      println("Clicked");
    } else if (v==false) {
      line(x, y, x+l, y);
    }
  }
  void update() {
    if (over) {
      if (v) {
        tPos=mouseY;
      } else if (v==false) {
        tPos=mouseX;
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
};
