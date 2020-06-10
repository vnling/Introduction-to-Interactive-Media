class Pacman {
  float xPos;
  float yPos;
  float xVel;
  float yVel;

  //pacman initialized with given position and no movement
  Pacman(float x, float y) {
    xPos = x;
    yPos = y;
    xVel = 0;
    yVel = 0;
  }

  //drawing pacman, outer if condition determines the direction pacman is going in
  //inner if condition allows for animation based on the framecount
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

  //pacman bounces off the edge of the frame
  void pacmanMoves() {
    if (xPos <= 0 || xPos >= 760) {
      xVel = -xVel;
      println("PACMAN BOUNCED " + xPos + " " + yPos + " " + xVel + " " + yVel);
    }
    if (yPos <= 0 || yPos >= 760) {
      yVel = -yVel;
      println("PACMAN BOUNCED " + xPos + " " + yPos + " " + xVel + " " + yVel);
    }
    //otherwise just move pacman as normal
    xPos += xVel;
    yPos += yVel;
  }
  
  //pacman changes direction based on key input (from keyPressed())
  void pacmanChangeDirection(String direction) {
   if (xPos > 5 && xPos < 755 && yPos > 5 && yPos < 755) {
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
  
}
