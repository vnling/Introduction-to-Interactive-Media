class Dinosaur {
  //initializing attributes
  int size;
  float xpos;
  float ypos;
  float yvel; //only needs yvel because only moves vertically
  float gravity = 0.5;

  Dinosaur() {
    size = 40;
    xpos = 100;
    ypos = height - size; //has to be on the ground
    //strangely it seems to initialize in mid-air?
  }

  void drawDinosaur() {
    image(dino, xpos, ypos, size, size);
  }

  void jumpDinosaur() {
    if (ypos >= 410) {  //had to hard code bc height - size is giving strange results
      yvel = -15; //arbitrarily chosen after playing around
    }
  }
  
  void moveDinosaur() {
    ypos += yvel;
    yvel += gravity;
    ypos = constrain(ypos, 0, height - size); //making sure the dinosaur doesn't fall below the ground
  }
}
