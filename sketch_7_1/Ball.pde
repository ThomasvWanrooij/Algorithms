//By Robin Venhuizen and Thomas van Wanrooij, 2019
//Ball class for state 4
class Ball {

  float mass; //mass
  float b = .4; //fluid resistance constant
  float g = 0.5; //acceleration due to gravity
  float accel = 0; //initial acceleration value
  float velocity = 10; // initial y velocity (downwards is positive)
  float yPos = 0; //initial y-position
  float c = 0.15; //spring constant
  float xPos;
  Ball(float initMass, float initX) {
    mass = initMass;
    xPos = initX;
  }

  void display() {
    accel = (g - (b/mass)*velocity-(c/mass)*(yPos-height/2));
    velocity += accel;
    yPos += velocity;
    fill(255);
    noStroke();
    ellipse(xPos, yPos, 40, 40);
  }
  void key() {
    velocity = 150;
  }
}
