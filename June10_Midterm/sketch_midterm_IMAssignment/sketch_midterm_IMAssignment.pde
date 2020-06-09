final int GRID_SIZE = 40;
final int CELLS_PER_ROW = 20;
PImage ghostR;
PImage ghostL;
PImage ghostD;
PImage ghostU;
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

int LIVES = 3;
int SCORE = 0;
Pacman pacman = new Pacman(50, 60);
Ghost[] ghosts = new Ghost[4];
Food[][] food = new Food[CELLS_PER_ROW][CELLS_PER_ROW];

void setup() {
  size(800, 850);
  for (int i = 0; i < ghosts.length; i++) {
    ghosts[i] = new Ghost(random(width), random(height));
  }
  
  for (int i = 0; i < CELLS_PER_ROW; i++) {
    for (int j = 0; j < CELLS_PER_ROW; j++) {
      food[i][j] = new Food(i, j);
    }
  }
  
  ghostR = loadImage("ghostR.png");
  ghostL = loadImage("ghostL.png");
  ghostD = loadImage("ghostD.png");
  ghostU = loadImage("ghostU.png");
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
  
  PFont font;
  font = createFont("Bauhaus 93", 50);
  textFont(font);
}

void draw() {
  background(0); 
  
  textSize(40);
  text("Lives: " + LIVES, 20, 830);
  text("Score: " + SCORE, 400, 830);
  
  
  for (int i = 0; i < CELLS_PER_ROW; i++) { //drawing food
    for (int j = 0; j < CELLS_PER_ROW; j++) {
      food[i][j].checkEaten(i, j);
      food[i][j].drawFood();
    }
  }
  
  pacman.drawPacman(); //drawing and moving pacman
  pacman.pacmanMoves();
  
  for (int i = 0; i < ghosts.length; i++) { //drawing and moving ghosts
    ghosts[i].drawGhost();
    ghosts[i].ghostMoves();
  }
  
  if (random(1) < 0.05) { //ghosts change direction
    ghosts[(int)random(4)].ghostChangeDirection();
  }
  
  scoring(); //updates score
  
  if (checkCollision()) { //checks for collision, reinstantiates new pacman if yes
    pacman = new Pacman(50, 60);
    LIVES--;
  }
  
  if (LIVES <= 0) { //checking lose condition
    background(0);
    textSize(50);
    fill(255);
    text("YOU LOST", 300, 300);
    text("BETTER LUCK NEXT TIME!", 130, 400);
    LIVES = 0;
    ghosts[0].drawGhost();
  }
  
  if (checkWin()) { //checking win condition
    background(0);
    ghosts[0].drawGhost();
    textSize(50);
    fill(255);
    text("CONGRATULATIONS!", 150, 300);
    text("YOU BEAT THE GHOSTS", 130, 400);
  }

}

void scoring() {
  int counter = 0;
  for (int i = 0; i < CELLS_PER_ROW; i++) {
    for (int j = 0; j < CELLS_PER_ROW; j++) { 
      if (food[i][j].eaten) {
        counter += 100;
      }
    }
  }
  SCORE = counter;
}

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

boolean checkCollision() {
  boolean collided = false;
  for (int i = 0; i < ghosts.length; i++) {
    if (dist(pacman.xPos, pacman.yPos, ghosts[i].xPos, ghosts[i].yPos) < 40) {
      collided = true;
    }
  }
  return collided;
}

void keyPressed() {
  if (keyCode == UP) {
    pacman.pacmanChangeDirection("up");
  }
  
  else if (keyCode == RIGHT) {
    pacman.pacmanChangeDirection("right");
  }
  
  else if (keyCode == LEFT) {
    pacman.pacmanChangeDirection("left");
  }
  
  else if (keyCode == DOWN) {
    pacman.pacmanChangeDirection("down");
  }
}
