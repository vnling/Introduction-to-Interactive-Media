final int GRID_SIZE = 50;
final int CELLS_PER_ROW = 16;
int LIVES = 10000;
int SCORE = 0;
Pacman pacman = new Pacman(50, 60);
Ghost[] ghosts = new Ghost[4];
Food[][] food = new Food[CELLS_PER_ROW][CELLS_PER_ROW];

//load images
//load sounds

void setup() {
  size(800, 820);
  for (int i = 0; i < ghosts.length; i++) {
    ghosts[i] = new Ghost(random(width), random(height));
  }
  
  for (int i = 0; i < CELLS_PER_ROW; i++) {
    for (int j = 0; j < CELLS_PER_ROW; j++) {
      food[i][j] = new Food(i, j);
    }
  }
}

void draw() {
  background(0); 
  
  textSize(15);
  text("Lives: " + LIVES, 20, 805);
  text("Score: " + SCORE, 400, 805);
  
  
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
    pacman.xVel = 0;
    pacman.yVel = 0;
    for (int i = 0; i < ghosts.length; i++) {
      ghosts[i].xVel = 0;
      ghosts[i].yVel = 0;
    }
    background(0);
    textSize(50);
    fill(255);
    text("LOSER", 50, 50);
    LIVES = 0;
  }
  
  if (checkWin()) { //checking win condition
    background(0);
    textSize(50);
    fill(255);
    text("YOU WON WHEEEE", 50, 50);
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
