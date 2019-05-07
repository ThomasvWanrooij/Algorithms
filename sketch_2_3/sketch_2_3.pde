// Thomas van Wanrooij, Robin Venhuizen, 2019

void setup() {
  size(800, 800);
  background(255);
}

void draw() {
  for (int i = 0; i<10; i++) {
    float xLoc = (width/2)+randomGaussian()*200;
    float yLoc = (height/2)+randomGaussian()*200;

    float d = dist(xLoc, yLoc, width/2, height/2);
    float size = map(d, 0, width, 100, 1);

    fill(0, 0, 100,  20);
    noStroke();
    ellipse(xLoc, yLoc, size, size);
  }
}
