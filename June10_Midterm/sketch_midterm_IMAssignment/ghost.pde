class Ghost {
  float xPos;
  float yPos;
  float xVel;
  float yVel;

  //initializing ghosts with given positions (as called in main) and no movement
  Ghost(float x, float y) {
    xPos = x;
    yPos = y;
    xVel = 0;
    yVel = 0;
  }

  //drawing the ghosts by loading different images based on the directions they are going in
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

  //ghosts should bounce off the side of the frame when they hit it
  void ghostMoves() {
    if (xPos <= 0 || xPos >= 760 || yPos <= 0 || yPos >= 760) {
      xVel = -xVel;
      yVel = -yVel;
    }
    //otherwise just keep on going
    xPos += xVel;
    yPos += yVel;
  }
  
  //change the direction of the ghosts at random
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
