class Catcher {
  PVector loc;
  int d;

  Catcher() {
    loc = new PVector(mouseX, height-d);
       d= 30;
  }

  void display() {
    //rect(loc.x,loc.y,d,d/2;
    ellipse(loc.x, loc.y, d, d);
    loc = new PVector(mouseX, height-d);
  }
  void catchDrop(raindrop drop) {
    if (loc.dist(drop.loc) < d/2 + d/2) {
      drop.loc.set(-width, height*10);
      drop.vel.set(0,0);
      score++;
    }
}
}

