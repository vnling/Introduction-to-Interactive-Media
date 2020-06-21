class Powerup {
  float xPos;
  float yPos;
  boolean eaten;

  Powerup(float x, float y) {
    xPos = x;
    yPos = y;
  }
  
  void drawPowerup() {
    if (!eaten) {
      circle(xPos, yPos, 20);
    }
  }
  
  boolean checkEaten(int i) {
    if (dist(pacman.xPos, pacman.yPos, powerup[i].xPos, powerup[i].yPos) <= 41 && 
      powerup[i].xPos > pacman.xPos && powerup[i].yPos > pacman.yPos) 
    {
      powerup[i].eaten = true;
      return true;
    }
    return false;
  }
  

}
