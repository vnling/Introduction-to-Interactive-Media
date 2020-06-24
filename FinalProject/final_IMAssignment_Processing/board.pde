//2D array,  used to construct game in setup() 
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

  Wall(int x, int y) {
    xGrid = x;
    yGrid = y;
  }

  //walls drawn as solid blue squares
  void drawWall() {
    fill(33, 33, 222);
    stroke(33, 33, 222);
    square(xGrid*GRID_SIZE, yGrid*GRID_SIZE, GRID_SIZE);
  }
}
