//Robin Venhuizen and Thomas van Wanrooij, 2019

class Water {

  float yPos = height/2; 
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
  float initialY;

  Water(float initX) {
    //initialY = initY;
    xPos = initX;
    //yPos = initY;
  }

  void MSD() {    
    //MSD system according to block scheme provideed
    accel = -force/mass;
    velocity += accel;
    yPos += velocity;
    force = fDamp * velocity + constant * (yPos-height/2) + (randomGaussian()-randomGaussian()); //sum force to calculate total force

    // Drawing of ellipses
    strokeWeight(7);
    stroke(0,51,102, 200);
    line(xPos,yPos,xPos,height);
    strokeWeight(1);
  }

  // Add a new starting force to reset the effect when droplets have reached standstill
  void mouse() {
    force = 500;
  }
}
