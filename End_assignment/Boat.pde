//Boat image taken from: https://www.kisspng.com/png-motor-boats-ship-clip-art-boat-749436/
class Boat {

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

  void display() {
    noStroke();
    fill(255, 0, 0);
    boatPos.add(boatSpeed);
    println(boatPos);
    imageMode(CENTER);
    image(boatImg, boatPos.x, boatPos.y);
    waterdrops.run();
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
