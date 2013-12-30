class Catcher { //This class creates the catcher at the bottom which catches the raindrops
  PVector loc;
  PImage img;
  float d;

  Catcher() {
    loc = new PVector(mouseX, height-d);
    d= 30;
    img = loadImage("p.png"); // This is the image which catcher the raindrops.
  }

  void display() { //This displays the class Catcher in the raindrops_game.
    loc = new PVector(mouseX, height-d);
    image(img, loc.x, loc.y); 
    imageMode(CENTER);
  }
  void catchDrop(raindrop drop) { //Catches raindrops and increases the score.
    if (loc.dist(drop.loc) < 40) {
      drop.loc.set(-width, height*-10);
      drop.vel.set(0, 0);
      score++;
    }
  }
  void miss(raindrop drop) { // If the raindrop makes it to the bottom of the screen without being caught, lives decrease
    if (drop.loc.y> height) {
      drop.loc.set(width, height * -10);
      drop.vel.set(0, 0);
      lives --; 
      if (lives == 0) { // If lives = 0, then the game over screen will appear (lose = true)
        lose = true;
      }
    }
  }
}

