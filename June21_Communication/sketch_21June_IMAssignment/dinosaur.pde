class Dinosaur {
  int size;
  float xpos;
  float ypos;
  float yvel;
  float gravity = 0.5;

  Dinosaur() {
    size = 40;
    xpos = 100;
    ypos = height - size;
  }

  void drawDinosaur() {
    image(dino, xpos, ypos, size, size);
  }

  void jumpDinosaur() {
    if (ypos >= 510) {  //had to hard code bc height - size is dodge
      yvel = -15;
    }
  }
  
  void moveDinosaur() {
    ypos += yvel;
    yvel += gravity;
    ypos = constrain(ypos, 0, height - size);
  }
}
