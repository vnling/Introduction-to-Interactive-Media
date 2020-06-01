void setup() {
  size(800, 800);
  background(0);
  frameRate(5);
}

void draw() {
  stroke(255);
  while (frameCount < random(40)) {
    initialize();
  }
}

void initialize() {
   float firstPointOnDiagonal = random(800);
   strokeWeight(random(0, 5));
   line(firstPointOnDiagonal, 0, firstPointOnDiagonal, firstPointOnDiagonal);
   
   float secondPointOnDiagonal = random(800);
   strokeWeight(random(0, 5));
   line(secondPointOnDiagonal, 800, secondPointOnDiagonal, secondPointOnDiagonal);
}
