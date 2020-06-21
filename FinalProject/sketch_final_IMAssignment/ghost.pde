class Ghost {
  float xPos;
  float yPos;
  float xVel;
  float yVel;
  boolean vulnerable;

  //initializing ghosts with given positions (as called in main) and no movement
  Ghost(float x, float y) {
    xPos = x;
    yPos = y;
    xVel = 0;
    yVel = 0;
    vulnerable = false;
  }

  //drawing the ghosts by loading different images based on the directions they are going in
  void drawGhost() {
    //if scared
    if (vulnerable) {
      if (frameCount%16 < 4) {
        image(scaredGhost1, xPos, yPos, 40, 40);
      }
      else if (frameCount%16 >= 4 && frameCount%16 < 8) {
        image(scaredGhost2, xPos, yPos, 40, 40);
      }
      else if (frameCount%16 >= 8 && frameCount%16 < 12) {
        image(scaredGhost2, xPos, yPos, 40, 40);
      }
      else if (frameCount%16 >= 12) {
        image(scaredGhost3, xPos, yPos, 40, 40);
      }
      
      
    } else {
      if (xVel > 0) {
        image(ghostR, xPos, yPos, 40, 40);
      } else if (xVel < 0) {
        image(ghostL, xPos, yPos, 40, 40);
      } else if (yVel > 0) {
        image(ghostD, xPos, yPos, 40, 40);
      } else if (yVel < 0) {
        image(ghostU, xPos, yPos, 40, 40);
      } else {
        image(ghostR, xPos, yPos, 40, 40);
      }
    }
  }

  //ghosts should bounce off the side of the frame when they hit it
  void ghostMoves() {
    if (xPos <= 0 || xPos >= 760) {
      xVel = -xVel;
    }
    if (yPos <= 0 || yPos >= 760) {
      yVel = -yVel;
    }
    //otherwise just keep on going
    xPos += xVel;
    yPos += yVel;
  }

  //change the direction of the ghosts at random
  void ghostChangeDirection() {
    float direction = random(3);
    if (xPos > 5 && xPos < 755 && yPos > 5 && yPos < 755) {
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
}
