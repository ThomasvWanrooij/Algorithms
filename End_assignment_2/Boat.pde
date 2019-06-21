//Boat image taken from: https://www.kisspng.com/png-motor-boats-ship-clip-art-boat-749436/
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

  void run(float xMouse) {
    boat.display(xMouse);
    boat.reset();
  }

  void display(float xMouse2) {
    noStroke();
    fill(255, 0, 0);
    boatPos.add(boatSpeed);
    imageMode(CENTER);
    image(boatImg, boatPos.x, boatPos.y);

    if (floating) {
      waterdrops.run();
    } else if (floating == false) {
      boatPos.x = xMouse2;
    }
  }

  void click() {
    boatSpeed.y = 20;
  }

  void reset() {
    if (boatPos.x > width-20) {
      boatPos.set(initialX, initialY);
      boatSpeed.set(0, 0);
      floating = false;
    }
  }
}
