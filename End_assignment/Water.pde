// Create a water column with an applied MSD system
// Gaussian random function is used to create a dynamic water surface
// Robin Venhuizen and Thomas van Wanrooij, 2019

class Water {

  float yPos = height/2; 
  float mass = 25; // starting mass
  float constant = 0.7; // spring constant
  float force; 
  float velocity;
  float accel;
  float xPos;
  float fDamp = 0.99; //Dampening coefficient 
  float neighbourForce;

  Water(float initX) {
    xPos = initX;
  }

  // MSD system according to block scheme provided
  void MSD() {    
    accel = -force/mass;
    velocity += accel;
    yPos += velocity;
    force = fDamp * velocity + constant * (yPos-height/2) + (randomGaussian()-randomGaussian()); // Sum force to calculate total force

    // Drawing of columns
    strokeWeight(7);
    stroke(0,51,102, 200);
    line(xPos,yPos,xPos,height);
    strokeWeight(1);
  }

  // Apply a force to the water columns when the mouse is clicked, to simulate the boat splashing into the water
  void mouse() {
    force = 500;
  }
}
