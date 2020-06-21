import processing.serial.*;

Serial myPort;
int switchInput = 0;

Dinosaur dinosaur = new Dinosaur();
ArrayList<Cactus> cacti = new ArrayList<Cactus>();
PImage cactus;
PImage dino;
boolean gameOver;

void setup() {
  size(1000, 600);
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil('\n');

  cactus = loadImage("ghostL.png");
  dino = loadImage("pacman2.png");
}

void draw() {
  background(0);
  dinosaur.drawDinosaur();

  dinosaur.moveDinosaur();

  if (random(1) < 0.02) {
    cacti.add(new Cactus());
  }

  for (int i = 0; i < cacti.size(); i++) {
    cacti.get(i).moveCactus();
    cacti.get(i).drawCactus();
  } 

  if (checkCollision()) {
    gameOver = true;
  }

  if (gameOver) {
    background(0);
    textSize(50);
    text("YOU LOST BOOOO", 20, 20);
  }
}

void serialEvent (Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    // trim off any whitespace:
    inString = trim(inString);
    // convert to an int and map to the screen height:
    switchInput = int(inString);
    println(switchInput);
    if (switchInput == 1) {
      dinosaur.jumpDinosaur();
    }
  }
}

boolean checkCollision() {
  boolean collided = false;
  for (int i = 0; i < cacti.size(); i++) {  
    if (dist(dinosaur.xpos, dinosaur.ypos, cacti.get(i).xpos, cacti.get(i).ypos) < 40) {
      collided = true;
    }
  }
  return collided;
}
