class Cactus {
  //initializing attributes
  int size; 
  float xpos;
  float ypos;
  float xvel; //yvel not necessary because it only moves horizontally

  Cactus() {
    //constructor
    size = 40;
    xpos = width; //initializes at far end of screen
    ypos = height - size; //has to be on the ground
  }
  
  void drawCactus() {
    image(cactus, xpos, ypos, size, size);
  }
  
  void moveCactus() {
    xpos -= 3; //arbitrarily chosen after playing around
  }

}
