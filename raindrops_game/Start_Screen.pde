class startup {
  PVector loc;
  PVector vel;
  PImage img;
  boolean start;

  startup() {
    loc = new PVector(width/2, height/2);
    img = loadImage("crying-meme.png");
  }

  void display(if(start = true)) {
    image(img, loc.x, loc.y);
    text("Tears are the gateway to one's past.",width/2,height/2);
  }

//  void opening screen() {
//    start = true;
  }

  void mousePressed(start = true;) {
    if (mouseX < 325 && mouseX > 275 && mouseY < 275 && mouseY > 325) {
      start = !start;
    }
  }

