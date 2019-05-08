// Robin Venhuizen and Thomas van Wanrooij, 2019
// By the aid of the tutorial made by Daniel Shiffman, https://www.youtube.com/watch?v=IKB1hWWedMk&t=136s

int cols, rows;
int scl = 20;
int w = 2000;
int h = 1600;

float bird = 0;

float [][] planet;

void setup() {
  size(600, 600, P3D);
  cols = w / scl;
  rows = h / scl;
  planet = new float[cols][rows];
}

void draw() {
  bird -= 0.2;

  float yoff = bird;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      planet[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff += 0.2;
    }
    yoff += 0.2;
  }

  background(103, 166, 255);
  stroke(110);
  fill(54, 159, 54);
  //for (int y = 0; y<rows-1; y++) {
  //  for (int x = 0; x < cols; x++) {
  //    float heightcolor = map(planet[x][y], -100, 100, -20, 100);
  //    fill(24+heightcolor, 129+heightcolor, 24+heightcolor);
  //  }
  //}

  translate(width/2, height/2);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  for (int y = 0; y<rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, planet[x][y]);
      vertex(x*scl, (y+1)*scl, planet[x][y+1]);
    }
    endShape();
  }
}
