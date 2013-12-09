class raindrop {
  PVector loc;
  PVector vel;

  raindrop() {
    loc = new PVector(random(width), 0);
    vel = new PVector( 0,5); 
  }

  void display() {
    ellipse(loc.x, loc.y, 25, 25);
  }
  void raining() {
    loc.add(vel);
  }
}

