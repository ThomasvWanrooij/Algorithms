//Changed from the noise1D example
//Robin Venhuizen and Thomas van Wanrooij, 2019

float xoff = 0.0;
float yoff;
float xincrement = 0.01;
float yincrement= 0.01;

void setup() {
  size(640, 360);
  background(0);
  noStroke();
}

void draw() {
  // Create an alpha blended background
  fill(0, 10);
  rect(0, 0, width, height);

  // Get a noise value based on xoff and scale it according to the window's width
  float x = noise(xoff)*width;
  // Get a noise value based on yoff and scale it according to the window's height
  float y = noise(0, yoff)*height;

  // With each cycle, increment xoff and yoff
  xoff += xincrement;
  yoff += yincrement;

  // Draw the ellipse at the value produced by perlin noise
  fill(200);
  ellipse(x, y, 64, 64);
}
