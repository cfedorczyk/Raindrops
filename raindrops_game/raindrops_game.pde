int index = 1;
raindrop[] r = new raindrop[105];
Catcher catcher;
boolean time = true;

void setup() {
  size (600, 600);
  for ( int i = 0; i < r.length; i++) {
    r[i] = new raindrop();
  }
  catcher = new Catcher();
  frameRate(15);
}

void draw() {
  background(0);
  if (second()%3 == 0 && time) {
    index++;
    time = false;
  } 
  else if (second()%3 == 1 && !time) {
    time = true;
  }
  for ( int i = 0; i < index; i++) {
    r[i].display();
    r[i].raining();
    catcher.catchDrop(r[i]);
  }
  catcher.display();
}

