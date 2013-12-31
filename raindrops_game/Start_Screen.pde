class startup {
  PVector loc;
  PVector vel;
  PImage img;

  startup() {
    img = loadImage("crying.png");
    loc = new PVector(width/2, height/2);
  }

  void display() { //Displays what is seen in the start screen.
    text("Play until the story finishes.",175,50); //Tels when the game is finished.
    text("Tears are the gateway to one's past.", width/2, height/2);
    imageMode(CORNER);
    image(img, loc.x, loc.y);
  }
}

