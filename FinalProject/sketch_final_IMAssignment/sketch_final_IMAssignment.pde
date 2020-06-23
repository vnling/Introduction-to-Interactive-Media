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
PImage ghost1R;
PImage ghost1L;
PImage ghost1D;
PImage ghost1U;
PImage ghost2R;
PImage ghost2L;
PImage ghost2D;
PImage ghost2U;
PImage ghost3R;
PImage ghost3L;
PImage ghost3D;
PImage ghost3U;
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
int LIVES = 3000;
int SCORE = 0;
int freezeFrame;

//initializing the pacman, ghost, and food instances
//pacman is created in the top left corner
Pacman pacman = new Pacman(4, 4);
ArrayList<Ghost> ghosts = new ArrayList<Ghost>();
ArrayList<Powerup> powerup = new ArrayList<Powerup>();
ArrayList<Food> food = new ArrayList<Food>();
ArrayList<Wall> walls = new ArrayList<Wall>();

void setup() {
  size(800, 850);
  frameRate(10);

  //playing music
  minim = new Minim(this);
  player = minim.loadFile("pacman.mp3");
  //player.loop();

  for (int i = 0; i < BLUEPRINT.length; i++) {
    for (int j = 0; j < BLUEPRINT[i].length; j++) {
      //wall
      if (BLUEPRINT[i][j] == 'W') {
        walls.add(new Wall(j, i));
      } else if (BLUEPRINT[i][j] == ' ') {
        food.add(new Food(j, i));
      } else if (BLUEPRINT[i][j] == 'P') {
        powerup.add(new Powerup(j, i));
      } else if (BLUEPRINT[i][j] == 'G') {
        ghosts.add(new Ghost(j, i));
      }
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
  ghost1R = loadImage("ghost1R.png");
  ghost1L = loadImage("ghost1L.png");
  ghost1D = loadImage("ghost1D.png");
  ghost1U = loadImage("ghost1U.png");
  ghost2R = loadImage("ghost2R.png");
  ghost2L = loadImage("ghost2L.png");
  ghost2D = loadImage("ghost2D.png");
  ghost2U = loadImage("ghost2U.png");
  ghost3R = loadImage("ghost3R.png");
  ghost3L = loadImage("ghost3L.png");
  ghost3D = loadImage("ghost3D.png");
  ghost3U = loadImage("ghost3U.png");
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
  font = createFont("PressStart2P.ttf", 50);
  textFont(font);
}

void draw() {
  //background wiped every iteration of draw() so no duplicate images
  background(0); 

  //hub at the bottom displays lives and score
  fill(255);
  textSize(25);
  text("LIVES: " + LIVES, 20, 840);
  text("SCORE: " + SCORE, 400, 840);

  for (int i = 0; i < walls.size(); i++) {
    walls.get(i).drawWall();
  }
  
  //if powerups are eaten make ghosts vulnerable
  for (int i = 0; i < powerup.size(); i++) {
    if (powerup.get(i).checkEaten(i)) {
      freezeFrame = makeGhostsVulnerable();
    }
    powerup.get(i).drawPowerup();
  }

  //after certain amount of time ghosts are not vulnerable anymore
  makeGhostsNotVulnerable(freezeFrame);

  //drawing food if food has not been eaten
  for (int i = 0; i < food.size(); i++) { 
      food.get(i).checkEaten(i);
      food.get(i).drawFood();
  }

  //drawing and moving pacman
  pacman.drawPacman(); 
  pacman.pacmanMoves();

  //drawing and moving ghosts
  for (int i = 0; i < ghosts.size(); i++) { 
    ghosts.get(i).drawGhost(i);
    ghosts.get(i).ghostMoves();
  }

  //ghosts change direction 5% of the time
  for (int i = 0; i < ghosts.size(); i++) { 
    if (ghosts.get(i).currentDirection == "none" || random(1) < 0.05) {
      ghosts.get(i).ghostChangeDirection();
    }
    if ((ghosts.get(i).xGrid == 9 || ghosts.get(i).xGrid == 10) && ghosts.get(i).yGrid == 10) {
      ghosts.get(i).ghostChangeDirection("up");
    }
  }

  scoring(); //updates score

  //checks for collision, instantiates new pacman if yes
  if (checkCollision() == 1 && (pacman.xGrid != 4 || pacman.yGrid != 4)) { 
    pacman = new Pacman(4, 4);
    LIVES--;
  }

  //checking lose condition (all lives gone) and loading end screen if true
  if (LIVES <= 0) { 
    final int endScore = SCORE;
    background(0);
    textSize(50);
    fill(255);
    text("YOU LOST", 200, 300);
    text("BETTER LUCK\n NEXT TIME!", 130, 400);
    textSize(30);
    text("SCORE: " + endScore, 245, 550);
    LIVES = 0;
    ghosts.get(0).drawGhost(0);
  }

  //checking win condition (all food eaten and lives > 0) and loading end screen if true
  if (checkWin()) { 
    background(0);
    ghosts.get(1).drawGhost(1);
    textSize(40);
    fill(255);
    text("CONGRATULATIONS!", 100, 300);
    text("YOU DEFEATED\n THE GHOSTS", 160, 400);
  }
}

//-----------------------------------------------------
//function definitions begin here

//updates score based on number of food items eaten
void scoring() {
  int counter = 0;
  for (int i = 0; i < food.size(); i++) {
      if (food.get(i).eaten && !food.get(i).isFruit) {
        counter += 100;
      } else if (food.get(i).eaten) { //fruits are worth more
        counter += 400;
      }
  }
  SCORE = counter;
}

//checks if all food has been eaten
boolean checkWin() {
  boolean allEaten = true;
  for (int i = 0; i < food.size(); i++) {
      if (!food.get(i).eaten) {
        allEaten = false;
      }
  }
  return allEaten;
}

//checks if Pac-Man has collided with a ghost
//returns 0 for no collision, 1 for pacman eaten by ghost, 2 for ghost eaten by pacman
int checkCollision() {
  int collided = 0;
  for (int i = 0; i < ghosts.size(); i++) {
    if (pacman.xGrid == ghosts.get(i).xGrid && pacman.yGrid == ghosts.get(i).yGrid && ghosts.get(i).vulnerable == false) {
      collided = 1;
    } else if (pacman.xGrid == ghosts.get(i).xGrid && pacman.yGrid == ghosts.get(i).yGrid && ghosts.get(i).vulnerable == true) {
      ghosts.remove(i); 
      ghosts.add(new Ghost((int)random(8,12), 10)); //ghost "dies" and respawns
      SCORE += 400;
      collided = 2;
    }
  }
  return collided; 
}

//makes ghosts vulnerable to pacman
int makeGhostsVulnerable() {
  for (int i = 0; i < ghosts.size(); i++) {
    ghosts.get(i).vulnerable = true;
  }
  return frameCount;
}

void makeGhostsNotVulnerable(int freezeFrame) {
  if (frameCount - freezeFrame > 5*frameRate) { //make vulnerable for 5 seconds
    for (int i = 0; i < ghosts.size(); i++) {
      ghosts.get(i).vulnerable = false;
    }
  }
}

//allows the user to change Pac-Man's direction using arrow keys //refactor this with SerialEvent to match arduino
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
