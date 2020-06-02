/* For this assignment, I decided to create a mosaic of multicoloured squares that would "run" off the window one by one,
   with the artwork terminating where all squares are gone and only the black background is left.
*/

//initializing constant
final int SQUARE_DIMENSIONS = 25; //side length of squares
final int CELLS_PER_ROW = 20; //number of squares per row & column
final int BORDER_WIDTH = 150; //width of black border around mosaic

SquareObject[][] arrayOfSquares = new SquareObject[CELLS_PER_ROW][CELLS_PER_ROW]; //initializes 2D array of square objects

//initializing variables for later use
float xIndex = random(CELLS_PER_ROW); //x and y index of square to be moved (chosen at random)
float yIndex = random(CELLS_PER_ROW);
boolean squareHasRunOffscreen = true; //tracks whether or not the existing square has "run" offscreen 


void setup() {
  //setting up size of canvas, background, framerate
  size(800, 800);
  background(0);
  frameRate(120);
  
  //draws all squares
  for (int i = 0; i < CELLS_PER_ROW; i++) {
      for (int j = 0; j < CELLS_PER_ROW; j++) {
          arrayOfSquares[i][j] = new SquareObject(i, j);
      }
  } 
}

void draw() {
  //wipes background and redraws squares so the "tracks" of the squares that have gone before are not visible
  background(0);
  for (int i = 0; i < CELLS_PER_ROW; ++i) {
      for (int j = 0; j < CELLS_PER_ROW; ++j) {
          arrayOfSquares[i][j].drawSquare();
      }
  }
  
  //since the existing square is made to run at the end of the draw() loop, set it to false now
  squareHasRunOffscreen = false;
  
  //if the square is gone offscreen, set squareHasRun to true (so next square can be selected)
  if (arrayOfSquares[(int)xIndex][(int)yIndex].x >= 800 || arrayOfSquares[(int)xIndex][(int)yIndex].x <= -25 ||
    arrayOfSquares[(int)xIndex][(int)yIndex].y >= 800 || arrayOfSquares[(int)xIndex][(int)yIndex].y <= -25) {
    squareHasRunOffscreen = true;
  }
  
  //generate new x and y index to select new square if the previous square is offscreen
  if (squareHasRunOffscreen) {
    xIndex = random(CELLS_PER_ROW);
    yIndex = random(CELLS_PER_ROW);
  }
  
  //first time draw() is called, use globally declared x and y index, after that use the ones randomly generated above  
  //makes the chosen square "run" with randomly generated x and y speed (initialized in constructor) and draws said square
  arrayOfSquares[(int)xIndex][(int)yIndex].squareRun();
  arrayOfSquares[(int)xIndex][(int)yIndex].drawSquare();
}

class SquareObject
{
  //initializing attributes
  float x; //x position
  float y; //y position
  float xSpeed; //speed of x or factor to translate by in the x axis
  float ySpeed; //speed of y or factor to translate by in the y axis
  int dimensions; //side length of each square object
  float colorR; //variables to store randomly generated colors later
  float colorG;
  float colorB;
  
  SquareObject(int i, int j) {
    dimensions = 25; //initializes dimensions
    x = (i * dimensions + BORDER_WIDTH); //initializes position of object on canvas based on indices in 2D array
    y = (j * dimensions + BORDER_WIDTH);
    xSpeed = random(-20, 20); //randomly generates x and y speed
    ySpeed = random(-20, 20);
    colorR = random(256); //randomly generates color values
    colorG = random(256);
    colorB = random(256);
  }
  
  void drawSquare() {
    //draws square with color and side length as initialized above
    fill(colorR, colorG, colorB); 
    square(x, y, dimensions);
  }
  
 void squareRun() {
    x += xSpeed; //translates x and y position by x and y speed as initialized
    y += ySpeed;
    colorR += 5; //makes the color of each square get lighter as it approaches the edge
    colorG += 5;
    colorB += 5;
  }
}
