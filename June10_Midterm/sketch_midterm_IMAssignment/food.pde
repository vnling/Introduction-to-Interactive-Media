class Food {
  float xPos;
  float yPos;
  boolean eaten;
  
  Food(int i, int j) {
    xPos = i*GRID_SIZE + 0.5*GRID_SIZE;
    yPos = j*GRID_SIZE + 0.5*GRID_SIZE;
    eaten = false;
  }
  
  void drawFood() {
    if (!eaten) {
      circle(xPos, yPos, 3);
    }
  }

  void checkEaten(int i, int j) {
    if (dist(pacman.xPos, pacman.yPos, food[i][j].xPos, food[i][j].yPos) < 23) {
      food[i][j].eaten = true;
    }
     
  }
}
