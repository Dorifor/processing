void setup() {
  size(1000, 1000);
  background(30);
}

void draw() {
  frameRate(60);
  stroke(230, random(255));
  strokeWeight(random(20));
  
  for (var i = 0; i < width; i += random(width / 10)) {
    for (var j = 0; j < height; j += random(height / 10)) {
      point(i + random(-30, 30), j + random(-30, 30));
    }
  }
  
  if (frameCount >= 2000) {
    noLoop();
    print("finished");
  }
  
  saveFrame();
}
