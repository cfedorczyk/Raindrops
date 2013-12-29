//import ddf.minim.spi.*;
//import ddf.minim.signals.*;
//import ddf.minim.*;
//import ddf.minim.analysis.*;
//import ddf.minim.ugens.*;
//import ddf.minim.effects.*;
//
//Minim minim;
//AudioPlayer player;
PImage img;
//PImage img1;
//PImage img2;
//PImage img3;
//PImage img4;
//PImage img5;
PVector loc;
int lives = 1;
int index = 1; //This is for the individual raindrops.
int score = 0; //Variable that keeps track of score.
raindrop[] r = new raindrop[105]; //Array of raindrops.
Catcher catcher;
startup op; //(Opening screen)
boolean time = true; //A boolean to use for the time.
boolean start = false; //A boolean to use for the start screen.
boolean lose = false;
boolean win = false;
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
//  minim = new Minim(this);
//  player = minim.loadFile("Voldemort.mp3");
//  player.loop();
  img = loadImage("crying.png");
//img1 = loadImage("crying.png");
//img2 = loadImage("crying.png");
//img3 = loadImage("crying.png");
//img4 = loadImage("crying.png");
//img5 = loadImage("crying.png");
  loc = new PVector(width/2, height/2);
}

void draw() {

  if (!start) { //This is to display the start screen.
    background(0);
    op.display();
    text("Click guy to start", width/2, height-65);
  }
  else { //This plays the game after the start screen.
    background(0);
    text("Score =" +score, width/2, height/2);
    text("Lives =" +lives, width/2, (height/2)+100);
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
      catcher.miss(r[i]);
    }
    catcher.display();
  }
  if (lose == true) {
    start = false;
    background(0);
    text("TIME TO BE DEMENTED", width/2, height/2);
    image(img, loc.x, loc.y);
  }
  if (score == 1) {
    start = false;
    win = true;
    if (win == true) {
      background(0);
      text("STORY TIME", width/2, height/2);
      image(img, loc.x, loc.y);
    }
  }
}

void mousePressed() { //Used to make the boolean start true or not true. This changes the strat scren to the game.
  if (start == false && lose == false && win == false && mouseX < loc.x+img.width && mouseX > loc.x-img.width && mouseY < loc.y+img.height && mouseY > img.height-loc.y) {
    start=true;
  }
  if (start == false && lose == true && win == false && mouseX < loc.x+img.width && mouseX > loc.x-img.width && mouseY < loc.y+img.height && mouseY > img.height-loc.y) {
    start = true;
    lose = false;
    lives = 10;
    score = 0;
  }
  if (start == false && lose == false && win == true && mouseX < loc.x+img.width && mouseX > loc.x-img.width && mouseY < loc.y+img.height && mouseY > img.height-loc.y) {
    start = true;
    lose = false;
    win = false;
    lives = 1;
    score = 2;
  }
}

