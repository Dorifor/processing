void setup() {
  size(500, 500);
}

void draw() {
  background(30);
  circle(50, 50, 30 / (float(frameCount) / 5));
}
