class Food {
  float xPos;
  float yPos;
  boolean eaten;
  
  //constructor, one food item per grid square, all food begins as uneaten
  Food(int i, int j) {
    xPos = i*GRID_SIZE + 0.5*GRID_SIZE;
    yPos = j*GRID_SIZE + 0.5*GRID_SIZE;
    eaten = false;
  }
  
  //only draw uneaten food
  void drawFood() {
    if (!eaten) {
      circle(xPos, yPos, 4);
    }
  }
  
  //if distance between pacman and food is smaller than size of pacman + size of food, mark food as eaten
  void checkEaten(int i, int j) {
    if (dist(pacman.xPos, pacman.yPos, food[i][j].xPos, food[i][j].yPos) <= 41 && 
      food[i][j].xPos > pacman.xPos && food[i][j].yPos > pacman.yPos) 
    {
      food[i][j].eaten = true;
    }
     
  }
}
