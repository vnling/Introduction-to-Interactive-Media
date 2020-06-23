class Powerup {
  int xGrid;
  int yGrid;
  int xPos;
  int yPos;
  boolean eaten;

  Powerup(int x, int y) {
    xGrid = x;
    yGrid = y;
    xPos = x + 20;
    yPos = y + 20;
  }

  void drawPowerup() {
    if (!eaten) {
      fill(255);
      stroke(255);
      circle(xGrid*GRID_SIZE + 20, yGrid*GRID_SIZE + 20, 20);
    }
  }

  boolean checkEaten(int i) {
    if (pacman.xGrid == powerup.get(i).xGrid && pacman.yGrid == powerup.get(i).yGrid && !powerup.get(i).eaten) 
    {
      powerup.get(i).eaten = true;
      return true;
    }
    return false;
  }
}
