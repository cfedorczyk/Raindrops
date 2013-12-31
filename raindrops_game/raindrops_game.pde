import ddf.minim.spi.*;// For the soundtrack playing throughout
import ddf.minim.signals.*;// For the soundtrack playing throughout
import ddf.minim.*;// For the soundtrack playing throughout
import ddf.minim.analysis.*;// For the soundtrack playing throughout
import ddf.minim.ugens.*;// For the soundtrack playing throughout
import ddf.minim.effects.*;// For the soundtrack playing throughout

Minim minim; // For the soundtrack playing throughout
AudioPlayer player; // For the soundtrack playing throughout
PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PVector loc;
int lives = 1; //Lives given in beginning as well as a lives variable which will go to a lose screen after it reaches 0.
int index = 1; //This is for the individual raindrops.
int score = 0; //Variable that keeps track of score.
raindrop[] r = new raindrop[105]; //Array of raindrops.
Catcher catcher;
startup op; //(Opening screen)
boolean time = true; //A boolean to use for the time.
boolean start = false; //A boolean to use for the start screen.
boolean lose = false; // A boolean to use for when the player loses the game (score=0).
boolean win = false; //A boolean to use for when a player reaches a certain score in te game.


void setup() {
  size (600, 600);
  textSize(15);
  for ( int i = 0; i < r.length; i++) { //This declares the classes to be used and where single raindrops are created.
    r[i] = new raindrop();
  }
  catcher = new Catcher();
  op = new startup();
  frameRate(15);
  minim = new Minim(this);// For the soundtrack playing throughout
  player = minim.loadFile("Voldemort.mp3");// To load the soundtrack playing throughout
  player.loop(); // To loop the soundtrack to replay after it finishes.
  img =  loadImage("crying.png");
  img1 = loadImage("young-snape.jpg");
  img2 = loadImage("lily-friendzoning.jpg");
  img3 = loadImage("young-james.jpg");
  img4 = loadImage("bullied-snape.jpg");
  img5 = loadImage("In-the-end.jpg");
  img6 = loadImage("friendzoned-snape.jpg");
  img7 = loadImage("snape's-hair.jpg");

  loc = new PVector(width/2, height/2);
}

void draw() {

  if (!start) { //This is to display the start screen.
    background(0);
    op.display();
    text("Click guy to start.", 275, height-65); //How to go about game.
    text("He will be your guide.", 275, height-45);//How to go about game.
  }
  else { //This plays the game after the start screen.
    background(0);
    text("Score =" +score, width/2, height/2); //Keeps track of score.
    text("Lives =" +lives, width/2, (height/2)+100);//keep tracks of lives.
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
  if (lose == true) {//If score = 0 the lose boolean comes into play.
    start = false;
    background(loadImage("Voldemort.jpg"));
    text("TIME TO BE DEMENTED", width/2, height/2);
    image(img, loc.x, loc.y);
  }
  if (score == 3) {//If score = 3 the first page will appear. It is like this for all the pages.
    start = false;//This makes start = false
    win = true;//This makes win = true
    if (win == true) {//If win == true this occurs.
      background(0);
      text("Here is young Lily and Snape becoming best friends.", 0, 400);
      image(img1, 0, 0);
      image(img, loc.x, loc.y);
    }
  }
  if (score == 6) {//If the score is 6 the second page will appear.
    start = false;
    win = true;
    if (win == true) {
      background(0);
      text("Here we start to see  the forbidden curse", 0, 365);
      text("of friendzoning. Where are your eyes going", 0, 385);
      text("Lily?", 0, 405);
      image(img2, 0, 0);
      image(img3, 250, 400);
      image(img, loc.x, loc.y);
    }
  }
  if (score ==9) { //If the score is 9 the third page will appear.
    start = false;
    win = true;
    if (win == true) {
      background(0);
      text("Now Snape starts to get bullied by James Potter.", 0, 400);
      image(img4, 0, 0);
      image(img, loc.x, loc.y);
    }
  }
  if (score == 12) {//If score equals 12 then the fourth page will appear.
    start = false;
    win = true;
    if (win == true) {
      background(0);
      text("In the end Lily picks James Potter but", 0, 365 );
      text("Snape never stopped loving her. Even after", 0, 385);
      text("her horrible death at the hands of Voldemort.", 0, 405);
      image(img5, 0, 0);
      image(img, loc.x, loc.y);
    }
  }
  if (score == 16) {//If score equals 16 then the fifth page will appear.
    start = false;
    win = true;
    if (win == true) {
      background(0);
      text("The picture above is the moral.", 0, 365);
      image(img6, 0, 0);
      image(img, loc.x, loc.y);
    }
  }
  if (score == 20) {//If score equals 20 then the sixth page will appear.
    start = false;
    win = true;
    if (win == true) {
      background(0);
      text("Now he flips his hair for a living. ", 0, 425);
      text("Oh and he teaches at Hogwarts.", 0, 450);
      image(img7, 0, 0);
      image(img, loc.x, loc.y);
    }
  }
  if (score == 25) {//If the player score is 25 they have completed the game.
    start = false;
    win = true;
    if (win == true) {
      background(0);
      text("Now you know the story of Severus Snape. The End", 175, height/2);
      image(img, loc.x, loc.y);
    }
  }
}

void mousePressed() { 
  if (start == false && lose == false && win == false && mouseX < loc.x+img.width && mouseX > loc.x-img.width && mouseY < loc.y+img.height && mouseY > img.height-loc.y) {
    start=true; //Used to make the boolean start true or not true. This changes the strat screen to the game.
  }
  if (start == false && lose == true && win == false && mouseX < loc.x+img.width && mouseX > loc.x-img.width && mouseY < loc.y+img.height && mouseY > img.height-loc.y) { //This makes the lose screen appear.
    start = true;
    lose = false;
    lives =1;
    score = 0;
  }
  if (start == false && lose == false && win == true && score == 25 && mouseX < loc.x+img.width && mouseX > loc.x-img.width && mouseY < loc.y+img.height && mouseY > img.height-loc.y) { // This makes the page appear and grants one extra life and it is the same as all the ones below.
    start = true;
    lose = false;
    win = false;
    lives++;
    score = 26;
  }
  if (start == false && lose == false && win == true && score == 20 && mouseX < loc.x+img.width && mouseX > loc.x-img.width && mouseY < loc.y+img.height && mouseY > img.height-loc.y) {
    start = true;
    lose = false;
    win = false;
    lives++;
    score = 21;
  }
  if (start == false && lose == false && win == true && score == 16 && mouseX < loc.x+img.width && mouseX > loc.x-img.width && mouseY < loc.y+img.height && mouseY > img.height-loc.y) {
    start = true;
    lose = false;
    win = false;
    lives++;
    score = 17;
  }
  if (start == false && lose == false && win == true && score == 12 && mouseX < loc.x+img.width && mouseX > loc.x-img.width && mouseY < loc.y+img.height && mouseY > img.height-loc.y) {
    start = true;
    lose = false;
    win = false;
    lives++;
    score = 13;
  }
  if (start == false && lose == false && win == true && score == 9 && mouseX < loc.x+img.width && mouseX > loc.x-img.width && mouseY < loc.y+img.height && mouseY > img.height-loc.y) {
    start = true;
    lose = false;
    win = false;
    lives++;
    score = 10;
  }
  if (start == false && lose == false && win == true && score ==6 && mouseX < loc.x+img.width && mouseX > loc.x-img.width && mouseY < loc.y+img.height && mouseY > img.height-loc.y) {
    start = true;
    lose = false;
    win = false;
    lives ++;
    score = 7;
  }
  if (start == false && lose == false && win == true && score == 3 && mouseX < loc.x+img.width && mouseX > loc.x-img.width && mouseY < loc.y+img.height && mouseY > img.height-loc.y) {
    start = true;
    lose = false;
    win = false;
    lives++;
    score = 4;
  }
}

