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
    if (xVel > 0) {
      image(ghostR, xPos, yPos, 40, 40);
    }
    else if (xVel < 0) {
      image(ghostL, xPos, yPos, 40, 40);
    }
    else if (yVel > 0) {
      image(ghostD, xPos, yPos, 40, 40);
    }
    else if (yVel < 0) {
      image(ghostU, xPos, yPos, 40, 40);
    }
    else {
      image(ghostR, xPos, yPos, 40, 40);
    }
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
