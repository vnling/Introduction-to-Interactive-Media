class Pacman {
  int xGrid;
  int yGrid;
  int xPos;
  int yPos;
  float xVel;
  float yVel;
  boolean allowMove;
  String currentDirection;

  //pacman initialized with given position and no movement
  Pacman(int x, int y) {
    xGrid = x;
    yGrid = y;
    xPos = xGrid/GRID_SIZE;
    yPos = yGrid/GRID_SIZE;
    xVel = 0;
    yVel = 0;
    allowMove = false;
    currentDirection = "none";
  }

  //drawing pacman, outer if condition determines the direction pacman is going in
  //inner if condition allows for animation based on the framecount
  void drawPacman() {
    if (xVel > 0) {
      if (frameCount%12 < 4) {
        image(pacman1, xGrid*GRID_SIZE, yGrid*GRID_SIZE, 35, 35);
      } else if (frameCount%12 >= 4 && frameCount%12 < 8) {
        image(pacman2, xGrid*GRID_SIZE, yGrid*GRID_SIZE, 35, 35);
      } else if (frameCount%12 >= 8) {
        image(pacman3, xGrid*GRID_SIZE, yGrid*GRID_SIZE, 35, 35);
      }
    } else if (xVel < 0) {
      if (frameCount%12 < 4) {
        image(pacman7, xGrid*GRID_SIZE, yGrid*GRID_SIZE, 35, 35);
      } else if (frameCount%12 >= 4 && frameCount%12 < 8) {
        image(pacman8, xGrid*GRID_SIZE, yGrid*GRID_SIZE, 35, 35);
      } else if (frameCount%12 >= 8) {
        image(pacman9, xGrid*GRID_SIZE, yGrid*GRID_SIZE, 35, 35);
      }
    } else if (yVel > 0) {
      if (frameCount%12 < 4) {
        image(pacman4, xGrid*GRID_SIZE, yGrid*GRID_SIZE, 35, 35);
      } else if (frameCount%12 >= 4 && frameCount%12 < 8) {
        image(pacman5, xGrid*GRID_SIZE, yGrid*GRID_SIZE, 35, 35);
      } else if (frameCount%12 >= 8) {
        image(pacman6, xGrid*GRID_SIZE, yGrid*GRID_SIZE, 35, 35);
      }
    } else if (yVel < 0) {
      if (frameCount%12 < 4) {
        image(pacman10, xGrid*GRID_SIZE, yGrid*GRID_SIZE, 35, 35);
      } else if (frameCount%12 >= 4 && frameCount%12 < 8) {
        image(pacman11, xGrid*GRID_SIZE, yGrid*GRID_SIZE, 35, 35);
      } else if (frameCount%12 >= 8) {
        image(pacman12, xGrid*GRID_SIZE, yGrid*GRID_SIZE, 35, 35);
      }
    } else {
      if (frameCount%12 < 4) {
        image(pacman1, xGrid*GRID_SIZE, yGrid*GRID_SIZE, 35, 35);
      } else if (frameCount%12 >= 4 && frameCount%12 < 8) {
        image(pacman2, xGrid*GRID_SIZE, yGrid*GRID_SIZE, 35, 35);
      } else if (frameCount%12 >= 8) {
        image(pacman3, xGrid*GRID_SIZE, yGrid*GRID_SIZE, 35, 35);
      }
    }
  }

  //pacman bounces off the edge of the frame
  void pacmanMoves() {
    if (xGrid == 0 && yGrid == 10 && currentDirection == "left") {
      xGrid = 20;
    } else if (xGrid == 19 && yGrid == 10 && currentDirection == "right") {
      xGrid = 0;
    }
    if (currentDirection == "up" && yGrid-1 >= -1 && BLUEPRINT[yGrid-1][xGrid] != 'W') {
      allowMove = true;
    } else if ( currentDirection == "down" && yGrid+1 < CELLS_PER_ROW && BLUEPRINT[yGrid+1][xGrid] != 'W') {
      allowMove = true;
    } else if (currentDirection == "left" && xGrid-1 >= 0 && BLUEPRINT[yGrid][xGrid-1] != 'W') {
      allowMove = true;
    } else if (currentDirection == "right" && xGrid+1 < CELLS_PER_ROW && BLUEPRINT[yGrid][xGrid+1] != 'W') {
      allowMove = true;
    }
    if (!allowMove) {
      currentDirection = "none";
    }
    switch(currentDirection) {
    case "up":
      xVel = 0;
      yVel = -1;
      break;
    case "down":
      xVel = 0;
      yVel = 1;
      break;
    case "left":
      yVel = 0;
      xVel = -1;
      break;
    case "right":
      yVel = 0;
      xVel = 1;
      break;
    case "none":
      xVel = 0;
      yVel = 0;
    }

    xGrid += xVel;
    yGrid += yVel;
    allowMove = false;
  }

  //pacman changes direction based on key input (from keyPressed())
  void pacmanChangeDirection(String direction) {
    switch(direction) {
    case "up":
      currentDirection = "up";
      break;
    case "down":
      currentDirection = "down";
      break;
    case "left":
      currentDirection = "left";
      break;
    case "right":
      currentDirection = "right";
      break;
    }
  }
}
