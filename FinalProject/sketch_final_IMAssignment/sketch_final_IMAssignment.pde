/*
  Concept: A simplified version of the famous arcade game Pac-Man. The player's aim is to eat all the food pellets
 while avoiding the ghosts. The player starts the game with three lives. Each collision with a ghost reduces the 
 player's lives by one, and the Pac-Man sprite respawns in the top left corner of the screen. Each food pellet consumed 
 gives the player a score increment of 100. 
 
 Instructions for use: The player can control Pac-Man's movement with the arrow keys on their computer. They should try to 
 avoid ghosts and eat the food pellets.
 
 Name: Vee Nis Ling
 Due Date: 24 June 2020
 */

//importing minim to process sound file
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//setting up minim
Minim minim;
AudioPlayer player;

//creating constants to represent grid size and the number of cells per row (for the food pellets, one pellet per cell)
final int GRID_SIZE = 40;
final int CELLS_PER_ROW = 20;


//initializing image objects
PImage fruit1;
PImage fruit2;
PImage fruit3;
PImage fruit4;
PImage fruit5;
PImage fruit6;
PImage ghostR;
PImage ghostL;
PImage ghostD;
PImage ghostU;
PImage scaredGhost1;
PImage scaredGhost2;
PImage scaredGhost3;
PImage scaredGhost4;
PImage pacman1;
PImage pacman2;
PImage pacman3;
PImage pacman4;
PImage pacman5;
PImage pacman6;
PImage pacman7;
PImage pacman8;
PImage pacman9;
PImage pacman10;
PImage pacman11;
PImage pacman12;

//setting the number of lives and the player's score as global variables
int LIVES = 3;
int SCORE = 0;
int freezeFrame;

//initializing the pacman, ghost, and food instances
//pacman is created in the top left corner
Pacman pacman = new Pacman(50, 60);
Ghost[] ghosts = new Ghost[4];
Powerup[] powerup = new Powerup[6];
Food[][] food = new Food[CELLS_PER_ROW][CELLS_PER_ROW];

void setup() {
  size(800, 850);

  //playing music
  minim = new Minim(this);
  player = minim.loadFile("pacman.mp3");
  //player.loop();

  //creating ghosts at random positions
  for (int i = 0; i < ghosts.length; i++) {
    ghosts[i] = new Ghost(300 + 50*i, 360); //hardcoded start points: now they all start in the middle!
  }

  //creating powerups
  for (int i = 0; i < powerup.length; i++) {
    powerup[i] = new Powerup(random(800), random(800));
  }

  //creating food, one item per grid square
  for (int i = 0; i < CELLS_PER_ROW; i++) {
    for (int j = 0; j < CELLS_PER_ROW; j++) {
      food[i][j] = new Food(i, j);
    }
  }

  //loading images
  fruit1 = loadImage("fruit1.png");
  fruit2 = loadImage("fruit2.png");
  fruit3 = loadImage("fruit3.png");
  fruit4 = loadImage("fruit4.png");
  fruit5 = loadImage("fruit5.png");
  fruit6 = loadImage("fruit6.png");
  ghostR = loadImage("ghostR.png");
  ghostL = loadImage("ghostL.png");
  ghostD = loadImage("ghostD.png");
  ghostU = loadImage("ghostU.png");
  scaredGhost1 = loadImage("scaredghost1.png");
  scaredGhost2 = loadImage("scaredghost2.png");
  scaredGhost3 = loadImage("scaredghost3.png");
  scaredGhost4 = loadImage("scaredghost4.png");
  pacman1 = loadImage("pacman1.png");
  pacman2 = loadImage("pacman2.png");
  pacman3 = loadImage("pacman3.png");
  pacman4 = loadImage("pacman4.png");
  pacman5 = loadImage("pacman5.png");
  pacman6 = loadImage("pacman6.png");
  pacman7 = loadImage("pacman7.png");
  pacman8 = loadImage("pacman8.png");
  pacman9 = loadImage("pacman9.png");
  pacman10 = loadImage("pacman10.png");
  pacman11 = loadImage("pacman11.png");
  pacman12 = loadImage("pacman12.png");

  //loading font
  PFont font;
  font = createFont("Bauhaus 93", 50);
  textFont(font);
}

void draw() {
  //background wiped every iteration of draw() so no duplicate images
  background(0); 

  //hub at the bottom displays lives and score
  textSize(40);
  text("Lives: " + LIVES, 20, 830);
  text("Score: " + SCORE, 400, 830);

  for (int i = 0; i < powerup.length; i++) {
    if (powerup[i].checkEaten(i)) {
      freezeFrame = makeGhostsVulnerable();
    }
    powerup[i].drawPowerup();
  }
  
  makeGhostsNotVulnerable(freezeFrame);

  //drawing food if food has not been eaten
  for (int i = 0; i < CELLS_PER_ROW; i++) { 
    for (int j = 0; j < CELLS_PER_ROW; j++) {
      food[i][j].checkEaten(i, j);
      food[i][j].drawFood();
    }
  }

  //drawing and moving pacman
  pacman.drawPacman(); 
  pacman.pacmanMoves();

  //drawing and moving ghosts
  for (int i = 0; i < ghosts.length; i++) { 
    ghosts[i].drawGhost();
    ghosts[i].ghostMoves();
  }

  //ghosts change direction 5% of the time
  if (random(1) < 0.05) { 
    ghosts[(int)random(4)].ghostChangeDirection();
  }

  scoring(); //updates score

  //checks for collision, instantiates new pacman if yes
  if (checkCollision() == 1 && pacman.xPos != 50 && pacman.yPos != 60) { 
    pacman = new Pacman(50, 60);
    LIVES--;
  }

  //checking lose condition (all lives gone) and loading end screen if true
  if (LIVES <= 0) { 
    final int endScore = SCORE;
    background(0);
    textSize(50);
    fill(255);
    text("YOU LOST", 300, 300);
    text("BETTER LUCK NEXT TIME!", 130, 400);
    textSize(30);
    text("SCORE: " + endScore, 315, 480);
    LIVES = 0;
    ghosts[0].drawGhost();
  }

  //checking win condition (all food eaten and lives > 0) and loading end screen if true
  if (checkWin()) { 
    background(0);
    ghosts[0].drawGhost();
    textSize(50);
    fill(255);
    text("CONGRATULATIONS!", 150, 300);
    text("YOU BEAT THE BLINKIES", 130, 400);
  }
}

//-----------------------------------------------------
//function definitions begin here

//updates score based on number of food items eaten
void scoring() {
  int counter = 0;
  for (int i = 0; i < CELLS_PER_ROW; i++) {
    for (int j = 0; j < CELLS_PER_ROW; j++) { 
      if (food[i][j].eaten && !food[i][j].isFruit) {
        counter += 100;
      }
      else if (food[i][j].eaten) { //fruits are worth more
        counter += 400;
      }
    }
  }
  SCORE = counter;
}

//checks if all food has been eaten
boolean checkWin() {
  boolean allEaten = true;
  for (int i = 0; i < CELLS_PER_ROW; i++) {
    for (int j = 0; j < CELLS_PER_ROW; j++) {
      if (!food[i][j].eaten) {
        allEaten = false;
      }
    }
  }
  return allEaten;
}

//checks if Pac-Man has collided with a ghost
//returns 0 for no collision, 1 for pacman eaten by ghost, 2 for ghost eaten by pacman
int checkCollision() {
  int collided = 0;
  for (int i = 0; i < ghosts.length; i++) {
    if (dist(pacman.xPos, pacman.yPos, ghosts[i].xPos, ghosts[i].yPos) < 40 && ghosts[i].vulnerable == false) {
      collided = 1;
    } else if (dist(pacman.xPos, pacman.yPos, ghosts[i].xPos, ghosts[i].yPos) < 40 && ghosts[i].vulnerable == true) {
      ghosts[i] = new Ghost(random(340, 460), 360); //ghost "dies" and respawns 
      SCORE += 400;
      collided = 2;
    }
  }
  return collided;
}

//makes ghosts vulnerable to pacman
int makeGhostsVulnerable() {
  for (int i = 0; i < ghosts.length; i++) {
    ghosts[i].vulnerable = true;
  }
  return frameCount;
}

void makeGhostsNotVulnerable(int freezeFrame) {
  if (frameCount - freezeFrame > 300) { //make vulnerable for 300 frames
    for (int j = 0; j < ghosts.length; j++) {
      ghosts[j].vulnerable = false;
    }
  }
}

//allows the user to change Pac-Man's direction using arrow keys
void keyPressed() {
  if (keyCode == UP) {
    pacman.pacmanChangeDirection("up");
  } else if (keyCode == RIGHT) {
    pacman.pacmanChangeDirection("right");
  } else if (keyCode == LEFT) {
    pacman.pacmanChangeDirection("left");
  } else if (keyCode == DOWN) {
    pacman.pacmanChangeDirection("down");
  }
}
