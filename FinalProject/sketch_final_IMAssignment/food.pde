class Food {
  float xPos;
  float yPos;
  boolean isFruit = false;
  boolean isFruit1 = false;
  boolean isFruit2 = false;
  boolean isFruit3 = false;
  boolean isFruit4 = false;
  boolean isFruit5 = false;
  boolean isFruit6 = false;
  boolean eaten;
  
  //constructor, one food item per grid square, all food begins as uneaten
  Food(int i, int j) {
    xPos = i*GRID_SIZE + 0.5*GRID_SIZE;
    yPos = j*GRID_SIZE + 0.5*GRID_SIZE;
    if (random(1) < 0.00125) {
      isFruit1 = true;
      isFruit = true;
    }
    else if (random(1) < 0.0025) {
      isFruit2 = true;
      isFruit = true;
    }
    else if (random(1) < 0.00375) {
      isFruit3 = true;
      isFruit = true;
    }
    else if (random(1) < 0.005) {
      isFruit4 = true;
      isFruit = true;
    }
    else if (random(1) < 0.00675) {
      isFruit5 = true;
      isFruit = true;
    }
    else if (random(1) < 0.0075) {
      isFruit6 = true;
      isFruit = true;
    }
    eaten = false;
  }
  
  //only draw uneaten food
  void drawFood() {
    if (!eaten && !isFruit) {
      circle(xPos, yPos, 4);
    }
    else if (!eaten && isFruit1) { //drawing fruits
      image(fruit1, xPos, yPos, 30, 30);
    }
    else if (!eaten && isFruit2) {
      image(fruit2, xPos, yPos, 30, 30);
    }
    else if (!eaten && isFruit3) {
      image(fruit3, xPos, yPos, 30, 30);
    }
    else if (!eaten && isFruit4) {
      image(fruit4, xPos, yPos, 30, 30);
    }
    else if (!eaten && isFruit5) {
      image(fruit5, xPos, yPos, 30, 30);
    }
    else if (!eaten && isFruit6) {
      image(fruit6, xPos, yPos, 30, 30);
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
