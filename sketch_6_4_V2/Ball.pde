class Ball {

  float yPos = 0;
  float mass = 1.5;
  float constant = 0.1;
  float force;
  float velocity;
  float accel;
  float xPos;
  float fDamp = 0.95;
  
  Ball(float initMass, float initX) {
    mass = initMass;
    xPos = initX;
  }

  void display() {
    force = -constant * (yPos-height/2);
    accel = force/mass;
    velocity = fDamp* (velocity + accel);
    yPos += velocity;
    
    fill(255);
    noStroke();
    ellipse(xPos, yPos, 40, 40);
  }
  void mouse() {
    velocity = 120;
  }
}
