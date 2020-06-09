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
    if (xVel > 0) {
      if (frameCount%12 < 4) {
        image(pacman1, xPos, yPos, 40, 40);
      }
      else if (frameCount%12 >= 4 && frameCount%12 < 8) {
        image(pacman2, xPos, yPos, 40, 40);
      }
      else if (frameCount%12 >= 8) {
        image(pacman3, xPos, yPos, 40, 40);
      }
    }
    else if (xVel < 0) {
      if (frameCount%12 < 4) {
        image(pacman7, xPos, yPos, 40, 40);
      }
      else if (frameCount%12 >= 4 && frameCount%12 < 8) {
        image(pacman8, xPos, yPos, 40, 40);
      }
      else if (frameCount%12 >= 8) {
        image(pacman9, xPos, yPos, 40, 40);
      }
    }
    else if (yVel > 0) {
      if (frameCount%12 < 4) {
        image(pacman4, xPos, yPos, 40, 40);
      }
      else if (frameCount%12 >= 4 && frameCount%12 < 8) {
        image(pacman5, xPos, yPos, 40, 40);
      }
      else if (frameCount%12 >= 8) {
        image(pacman6, xPos, yPos, 40, 40);
      }
    }
    else if (yVel < 0) {
      if (frameCount%12 < 4) {
        image(pacman10, xPos, yPos, 40, 40);
      }
      else if (frameCount%12 >= 4 && frameCount%12 < 8) {
        image(pacman11, xPos, yPos, 40, 40);
      }
      else if (frameCount%12 >= 8) {
        image(pacman12, xPos, yPos, 40, 40);
      }
    }
    else {
      if (frameCount%12 < 4) {
        image(pacman1, xPos, yPos, 40, 40);
      }
      else if (frameCount%12 >= 4 && frameCount%12 < 8) {
        image(pacman2, xPos, yPos, 40, 40);
      }
      else if (frameCount%12 >= 8) {
        image(pacman3, xPos, yPos, 40, 40);
      }
    }
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
