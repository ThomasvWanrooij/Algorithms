//Made by Robin Venhuizen and Thomas van Wanrooij, 2019
PImage img;
Rocket rocket1;

void setup() {
  size(500, 500);
  rocket1 = new Rocket();
  img = loadImage("rocket.png");
  imageMode(CENTER);
}

void draw() {
  background(0);
  rocket1.run();
}

void mousePressed() {
  rocket1.reset();
}
