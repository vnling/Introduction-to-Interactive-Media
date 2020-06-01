void setup() {
  size(800,800);
  background(0);
  frameRate(10);
}

void draw() {
  for (int i = 0; i < 40; i++) {
    for (int j = 0; j < 40; j++) {
      rotate(random(PI));
      fill(random(256));
      square(i*20, j*20, 20);
    }
  
  }

}
