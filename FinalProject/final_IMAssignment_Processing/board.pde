char[][] BLUEPRINT = {
  {'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W'}, 
  {'W', 'P', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'W', 'W', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'P', 'W'}, 
  {'W', ' ', 'W', 'W', ' ', 'W', 'W', 'W', ' ', 'W', 'W', ' ', 'W', 'W', 'W', ' ', 'W', 'W', ' ', 'W'}, 
  {'W', ' ', 'W', 'W', ' ', 'W', 'W', 'W', ' ', 'W', 'W', ' ', 'W', 'W', 'W', ' ', 'W', 'W', ' ', 'W'}, 
  {'W', ' ', ' ', ' ', ' ', 'W', 'W', 'W', ' ', 'W', 'W', ' ', 'W', 'W', 'W', ' ', ' ', ' ', ' ', 'W'}, 
  {'W', 'W', 'W', 'W', ' ', ' ', ' ', ' ', ' ', 'P', ' ', ' ', ' ', ' ', ' ', ' ', 'W', 'W', 'W', 'W'}, 
  {'W', 'W', 'W', 'W', ' ', 'W', 'W', 'W', 'W', ' ', ' ', 'W', 'W', 'W', 'W', ' ', 'W', 'W', 'W', 'W'}, 
  {'W', 'W', 'W', 'W', ' ', 'W', 'W', 'W', 'W', ' ', ' ', 'W', 'W', 'W', 'W', ' ', 'W', 'W', 'W', 'W'}, 
  {'W', 'W', 'W', 'W', ' ', 'W', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'W', ' ', 'W', 'W', 'W', 'W'}, 
  {'W', 'W', 'W', 'W', ' ', ' ', ' ', 'W', 'W', ' ', ' ', 'W', 'W', ' ', ' ', ' ', 'W', 'W', 'W', 'W'}, 
  {' ', ' ', ' ', ' ', ' ', 'W', ' ', 'W', 'G', 'G', 'G', 'G', 'W', ' ', 'W', ' ', ' ', ' ', ' ', ' '}, 
  {'W', 'W', 'W', 'W', ' ', 'W', ' ', 'W', 'W', 'W', 'W', 'W', 'W', ' ', 'W', ' ', 'W', 'W', 'W', 'W'}, 
  {'W', 'W', 'W', 'W', ' ', ' ', ' ', ' ', ' ', 'P', ' ', ' ', ' ', ' ', ' ', ' ', 'W', 'W', 'W', 'W'}, 
  {'W', 'W', 'W', 'W', ' ', 'W', ' ', 'W', 'W', 'W', 'W', 'W', 'W', ' ', 'W', ' ', 'W', 'W', 'W', 'W'}, 
  {'W', ' ', ' ', ' ', ' ', 'W', ' ', 'W', 'W', 'W', 'W', 'W', 'W', ' ', 'W', ' ', ' ', ' ', ' ', 'W'}, 
  {'W', ' ', 'W', 'W', ' ', 'W', ' ', ' ', 'W', 'W', 'W', 'W', ' ', ' ', 'W', ' ', 'W', 'W', ' ', 'W'}, 
  {'W', ' ', 'W', 'W', ' ', 'W', 'W', ' ', ' ', ' ', ' ', ' ', ' ', 'W', 'W', ' ', 'W', 'W', ' ', 'W'}, 
  {'W', ' ', 'W', 'W', ' ', ' ', ' ', ' ', 'W', 'W', 'W', 'W', ' ', ' ', ' ', ' ', 'W', 'W', ' ', 'W'}, 
  {'W', 'P', ' ', ' ', ' ', 'W', 'W', ' ', ' ', ' ', ' ', ' ', ' ', 'W', 'W', ' ', ' ', ' ', 'P', 'W'}, 
  {'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W'}, 
};

class Wall {
  int xGrid;
  int yGrid;
  int xPos;
  int yPos;

  Wall(int x, int y) {
    xGrid = x;
    yGrid = y;
    xPos = x*GRID_SIZE;
    yPos = y*GRID_SIZE;
  }

  void drawWall() {
    fill(50, 66, 168);
    stroke(50, 66, 168);
    square(xPos, yPos, GRID_SIZE);
  }
}