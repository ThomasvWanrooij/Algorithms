//Robin Venhuizen and Thomas van Wanrooij, 2019

class Ball {

  float yPos = height/2; // starting position
  float mass = 25; // starting mass
  float constant = 0.7; // spring constant
  float force; 
  float velocity;
  float accel;
  float xPos;
  float fDamp = 0.99; //Dampening coefficient 
  float right;
  float left;
  float neighbourForce;

  Ball(float initX) {
    xPos = initX;
  }

  void MSD() {    
    //MSD system according to block scheme provideed
    accel = -force/mass;
    velocity += accel;
    yPos += velocity;
    
    force = fDamp * velocity + constant * (yPos-height/2); //sum force to calculate total force

    // Drawing of ellipses
    fill(64, 164, 223);
    noStroke();
    ellipse(xPos, yPos, 10, 10);
  }

  // Add a new starting force to reset the effect when droplets have reached standstill
  void mouse() {
    force = 500;
  }
}
