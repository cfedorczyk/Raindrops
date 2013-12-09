class Catcher {
  PVector loc;
  int d = 50;

  Catcher() {
    loc = new PVector(mouseX, height-d);
  }

  void display() {
    rect(loc.x,loc.y,d,d/2;
    loc = new PVector(mouseX, height-d);
  }
  void catchDrop(raindrop drop) {
    if (loc.dist(drop.loc) < d/2 + drop.d/2) {
      print("lol");
    }
}
}

