import processing.serial.*;

//variables for receving arduino input
Serial myPort;
int switchInput = 0;

//global variables, initializing objects and game state
Dinosaur dinosaur = new Dinosaur();
ArrayList<Cactus> cacti = new ArrayList<Cactus>();
PImage cactus;
PImage dino;
boolean gameOver;
int score = 0;

void setup() {
  //sets up size of canvas and arduino loading
  size(1000, 500);
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil('\n');

  //image loading
  cactus = loadImage("ghostL.png");
  dino = loadImage("pacman2.png");
}

void draw() {
  //drawing background and dinosaur
  background(0);
  dinosaur.drawDinosaur();
  dinosaur.moveDinosaur();
  
  //setting score to frameCount
  score = frameCount;
  
  //drawing score in top right corner
  textSize(20);
  text("Score: " + score, 900, 20);

  //initializing new cacti 2% of the time
  if (random(1) < 0.02) {
    cacti.add(new Cactus());
  }

  //moving and drawing all cacti
  for (int i = 0; i < cacti.size(); i++) {
    cacti.get(i).moveCactus();
    cacti.get(i).drawCactus();
  } 

  //checking for collisions and ending game if yes
  if (checkCollision()) {
    gameOver = true;
  }

  //ending screen, score commented out because it doesn't freeze
  if (gameOver) {
    //final int endScore = score;
    background(0);
    textSize(50);
    text("YOU LOST", 400, 200);
    //text("SCORE: " + endScore, 370, 300);
  }
}

//serial event function, mostly copied from Graph example
void serialEvent (Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    // trim off any whitespace:
    inString = trim(inString);
    // convert to an int and map to the screen height:
    switchInput = int(inString);
    println(switchInput);
    if (switchInput == 1) { //make the dinosaur jump if the input is 1 (switch is pressed)
       dinosaur.jumpDinosaur();
    }
  }
}

//checking for collisions - reused my pacman code here
boolean checkCollision() {
  boolean collided = false;
  for (int i = 0; i < cacti.size(); i++) {  
    if (dist(dinosaur.xpos, dinosaur.ypos, cacti.get(i).xpos, cacti.get(i).ypos) < 40) {
      collided = true;
    }
  }
  return collided;
}
