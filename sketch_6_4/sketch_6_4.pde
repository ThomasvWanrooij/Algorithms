Ball [] balls1 = new Ball[11];

void setup() {
  size(800, 800);
  smooth();
  for (int i = 0; i<=5; i++) {
    balls1[i] = new Ball(0.5*i, 800-80*i);
  }
  for (int i = 6; i<11; i++) {
    balls1[i] = new Ball(0.5*(i-6), 80*(i-6));
  }
}

void draw() {
  background(0);
  for (int i = 0; i < 11; i++) {
    balls1[i].display();
  }
}

void mousePressed() {
  for (int i = 0; i < 11; i++) {
    balls1[i].mouse();
  }
}
