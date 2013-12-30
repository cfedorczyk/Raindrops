class raindrop { //The class that creates a single raindrop.
  PVector loc;
  PVector vel;
  PImage img;

  raindrop() { // This gives the raindrop a velocity and a location.
    loc = new PVector(random(width), 0);
    vel = new PVector( 0, 5);
    img = loadImage("teardrop.png");
  }

  void display() { //This funcions displays.
    image(img,loc.x,loc.y,25,25); //This is the image of a teardrop that is being used as the raindrop.
  }
  void raining() {//This function adds the velocity to the location to move the raindrop.
    loc.add(vel);
  }
}

