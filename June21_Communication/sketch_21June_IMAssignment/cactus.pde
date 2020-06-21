class Cactus {
  int size; 
  float xpos;
  float ypos;
  float xvel;

  Cactus() {
    size = 40;
    xpos = width;
    ypos = height - size;
  }
  
  void drawCactus() {
    image(cactus, xpos, ypos, size, size);
  
  }
  
  void moveCactus() {
    xpos -= 5; //arbitrarily chosen
  }

}
