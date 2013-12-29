class startup {
  PVector loc;
  PVector vel;
  PImage img;

  startup() {
    img = loadImage("crying.png");
    loc = new PVector(width/2, height/2);
  }

  void display() { //Displays what is seen in the start screen.

    text("Tears are the gateway to one's past.", width/2, height/2);
    imageMode(CENTER);
    image(img, loc.x, loc.y);
  }
}

