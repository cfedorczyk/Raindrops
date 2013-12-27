class Catcher {
  PVector loc;
  PImage img;
  float d;

  Catcher() {
    loc = new PVector(mouseX, height-d);
    d= 30;
    img = loadImage("p.png");
  }

  void display() {
    loc = new PVector(mouseX, height-d);
    image(img, loc.x, loc.y); //will use image as catcher once I can photoshop it.
    imageMode(CENTER);
    // rect(loc.x, loc.y, d, d/2);
    // ellipse(loc.x, loc.y, d, d);
  }
  void catchDrop(raindrop drop) { //Catching raindrops, increases the score.
    if (loc.dist(drop.loc) < 40) {
      drop.loc.set(-width, height*10);
      drop.vel.set(0, 0);
      score++;
    }
  }
  void miss(raindrop drop) {
    if (drop.loc.y> height) {
      drop.loc.set(width, height * -10);
      drop.vel.set(0, 0);
      lives --;
      if (lives == 0) {
        lose = true;
      }
    }
  }
}

