//Robin Venhuizen and Thomas van Wanrooij, 2019

class Ball {

  float yPos = height/2;
  float mass = 20;
  float constant = 0.6;
  float force;
  float velocity;
  float accel;
  float xPos;
  float fDamp = 0.95;
  float right;
  float left;


  Ball(float initX) {
    xPos = initX;
  }
  void update() {
    display();
    calculate();
   // velocity = right;
  }


  void calculate() {
    force = -constant * (yPos-height/2);
    accel = force/mass;
    velocity = fDamp * (velocity + accel);
    yPos += velocity;
  }

  void display() {
    fill(64, 164, 223);
    noStroke();
    ellipse(xPos, yPos, 10, 10);
  }


  void mouse() {
    velocity = 120;
  }
}
