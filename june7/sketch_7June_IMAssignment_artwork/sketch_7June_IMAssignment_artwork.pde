/* 
   This artwork was inspired by George Nees' Schotter. My version is a grid of squares with the rotation factor 
   increasing as you go from left to right across the x-axis, creating a visual effect of something orderly gradually 
   descending into chaos. The rotation factor of each square is generated randomly (but with increasing bounds at 
   higher x-position values). Both the translate() and rotate() transformations are used in this artwork to draw each square.
   
   Name: Vee Nis Ling
   Due Date: 7 June 2020
*/

//initializing width of border around squares, number of squares on x and y axes as constants
final int BORDER_WIDTH = 50;
final int SQUARES_X_AXIS = 22;
final int SQUARES_Y_AXIS = 10;

void setup() {
  //initializing size of canvas and background
  size(1200, 600);
  background(255);
  
  //drawing each square
  //done in setup() to create a static artwork, can also be done in draw() for a dynamic artwork
  for (int i = 0; i < SQUARES_X_AXIS; i++) {
    for (int j = 0; j < SQUARES_Y_AXIS; j++) {
      drawSquare(i, j);
    }
  }
}

void drawSquare(int i, int j) {
  pushMatrix(); //"remembering" canvas location
  translate(i*50 + BORDER_WIDTH, j*50 + BORDER_WIDTH); //translating the canvas to top left corner of each square
  float rotationFactor = i*180/66; //nothing magic about 180 or 66, just a ratio I liked after playing around
  rotate(radians(random(-rotationFactor, rotationFactor))); //rotating by random number generated using x-index
  fill(255, 255, 255, 0); //filling and drawing square
  square(0, 0, 50);
  popMatrix(); //to return canvas to original position
}
