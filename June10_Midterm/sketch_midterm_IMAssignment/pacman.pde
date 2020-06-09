class Pacman {
  float xPos;
  float yPos;
  float xVel;
  float yVel;

  Pacman(float x, float y) {
    xPos = x;
    yPos = y;
    xVel = 0;
    yVel = 0;
  }

  void drawPacman() {
    fill(255, 0, 0);
    circle(xPos, yPos, 50);
  }

  void pacmanMoves() {
    if (xPos <= 0 || xPos >= 800 || yPos <= 0 || yPos >= 800) {
      xVel = -xVel;
      yVel = -yVel;
    }
    xPos += xVel;
    yPos += yVel;
  }
  
  void pacmanChangeDirection(String direction) {
    switch(direction) {
      case "up":
        xVel = 0;
        yVel = -5;
        break;
      case "down":
        xVel = 0;
        yVel = 5;
        break;
      case "left":
        yVel = 0;
        xVel = -5;
        break;
      case "right":
        yVel = 0;
        xVel = 5;
        break;
    }
  }
  
}
