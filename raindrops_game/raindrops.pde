class raindrop { //The class that creates a single raindrop.
  PVector loc;
  PVector vel;

  raindrop() { // This gives the raindrop a velocity and a location.
    loc = new PVector(random(width), 0);
    vel = new PVector( 0, 5);
  }

  void display() { //This funcions displays.
    ellipse(loc.x, loc.y, 25, 25); //What shape the raindrop is
    fill(15, 35, 200);
  }
  void raining() {//This function adds the velocity to the location to move the raindrop.
    loc.add(vel);
  }
}

