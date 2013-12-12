class Catcher {
  PVector loc;
  //  PImage img;
  float d;

  Catcher() {
    loc = new PVector(mouseX, height-d);
    d= 30;
    //    img = loadImage("p.jpg");
  }

  void display() {
    loc = new PVector(mouseX, height-d);
    // image(img, loc.x, loc.y-300); //will use image as catcher once I can photoshop it.
    rect(loc.x, loc.y, d, d/2);
    // ellipse(loc.x, loc.y, d, d);
  }
  void catchDrop(raindrop drop) { //Catching raindrops, increases the score.
    if (loc.dist(drop.loc) < d) {
      drop.loc.set(-width, height*10);
      drop.vel.set(0, 0);
      score++;
    }
  }
}
