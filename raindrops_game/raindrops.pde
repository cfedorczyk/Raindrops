class raindrops {
  PVector loc;
  PVector vel;
  PVector acc;

  raindrops() {
    loc = new PVector(random(width), 0);
    vel = new PVector( 0, random(5)); 
    acc = new PVector(random(-.45, .45), .1);
  }

  void display() {
    ellipse(loc.x, loc.y, 50);
  }
  void raining() {
    loc.add(vel);
    vel.add(acc);
    if (loc.x> width || loc.x <0 ||loc.y>height) {
      loc.y=0;
      loc.x=random(width);
    }
  }
}
}
