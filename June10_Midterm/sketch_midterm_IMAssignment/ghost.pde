class Ghost {
  float xPos;
  float yPos;
  float xVel;
  float yVel;

  Ghost(float x, float y) {
    xPos = x;
    yPos = y;
    xVel = 0;
    yVel = 0;
  }

  void drawGhost() {
    fill(255);
    circle(xPos, yPos, 50);
  }

  void ghostMoves() {
    if (xPos <= 0 || xPos >= 800 || yPos <= 0 || yPos >= 800) {
      xVel = -xVel;
      yVel = -yVel;
    }
    xPos += xVel;
    yPos += yVel;
  }
  
  void ghostChangeDirection() {
    float direction = random(3);
    switch((int)direction) {
      case 0:
        xVel = 0;
        yVel = -5;
        break;
      case 1:
        xVel = 0;
        yVel = 5;
        break;
      case 2:
        yVel = 0;
        xVel = -5;
        break;
      case 3:
        yVel = 0;
        xVel = 5;
        break;
    }
  
  }
  
}
