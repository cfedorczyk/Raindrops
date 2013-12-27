import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer player;


int index = 1; //This is for the individual raindrops.
int score = 0; //Variable that keeps track of score.
raindrop[] r = new raindrop[105]; //Array of raindrops.
Catcher catcher;
startup op; //(Opening screen)
boolean time = true; //A boolean to use for the time.
boolean start = false; //A boolean to use for the start screen.
//boolean storytime = true;

void setup() {
  size (600, 600);
  textSize(15);
  for ( int i = 0; i < r.length; i++) { //This declares the classes to be used and where single raindrops are created.
    r[i] = new raindrop();
  }
  catcher = new Catcher();
  op = new startup();
  frameRate(15);
  minim = new Minim(this);
  player = minim.loadFile("Voldemort.mp3");
  player.loop();
}

void draw() {

  if (!start) { //This is to display the start screen.
    background(0);
    op.display();
    text("Click guy to start",width/2,height-65);
  }
  else { //This plays the game after the start screen.
    background(0);
    text("Score =" +score, width/2, height/2);
    if (second()%3 == 0 && time) {//This gives the raindrops set intervals to fall.
      index++;
      time = false;
    }
    else if (second()%3 == 1 && !time) {
      time = true;
    }
    for ( int i = 0; i < index; i++) {//Here is where one applies the functions from the declared classes.
      r[i].display();
      r[i].raining();
      catcher.catchDrop(r[i]);
    }
    catcher.display();
  }
//  if(storytime){
//   text("Storytime!",width/2,height/2);
//  }
}

void mousePressed() { //Used to make the boolean start true or not true. This changes the strat scren to the game.
  if (mouseX < width && mouseX > width/2 && mouseY < height && mouseY > height/2){
start=!start;
  }
}

