// This class creates a boat, allows it to be dropped down into the water and lets it float off to the edge of the screen. 
// The boat's positition is reset to mouseX when it has reached the end of the screen.
// Boat image taken from: https://www.kisspng.com/png-motor-boats-ship-clip-art-boat-749436/
// Robin Venhuizen and Thomas van Wanrooij, 2019

class Boat {
  Ocean ocean;
  ParticleSystem waterdrops;
  PVector boatPos;
  PVector boatSpeed;
  float initialY;
  float initialX;

  Boat(float initX, float initY) {
    initialY = initY;
    initialX = initX;
    boatPos  = new PVector(initX, initY);
    boatSpeed  = new PVector();
    boatImg = loadImage("boat2.png");
    waterdrops = new ParticleSystem();
  }

  //Runs methods of the boat
  void run(float xMouse) { 
    display();
    reset();
    motor(xMouse);
  }

  //Drawing of the boat
  void display() {
    noStroke();
    fill(255, 0, 0);
    boatPos.add(boatSpeed); //Velocity is added to move the boat forward
    imageMode(CENTER);
    image(boatImg, boatPos.x, boatPos.y);
    boatVector = boatPos;
  }

  //Drops the boat down upon click
  void click() {
    if (!floating) {
      boatSpeed.y = 20;
    }
  }

  //As the boat floats to the right and has touched the water surface, the particle system is started
  void motor(float xMouse2) {
    if (floating) {
      waterdrops.run(); //Run waterdrops particle system
    } else if (floating == false) {
      boatPos.x = xMouse2; //Returns boat-x-value to mouseX when reset method has been activated
    }
  }

  // The position of the boat is reset when on the edge of the screen
  void reset() {
    if (boatPos.x > width-20) {
      boatPos.set(initialX, initialY);
      boatSpeed.set(0, 0);
      floating = false;
    }
  }
}
