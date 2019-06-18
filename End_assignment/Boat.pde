//Boat image taken from: https://www.kisspng.com/png-motor-boats-ship-clip-art-boat-749436/
class Boat {

  float xPos;
  float yPos;
  float ySpeed;
  float xSpeed;
  float initialY;
  float initialX;

  Boat(float initX, float initY) {
    initialY = initY;
    initialX = initX;
    xPos = initX;
    yPos = initY;
    boatImg = loadImage("boat2.png");
  }

  void display() {
    noStroke();
    fill(255, 0, 0);
    yPos += ySpeed;
    xPos += xSpeed;
    imageMode(CENTER);
    image(boatImg,xPos,yPos);
  }

  void click() {
    ySpeed = 20;
  }

  void reset() {
    if (xPos > width-20) {
      xPos = initialX;
      xSpeed = 0;
      yPos = initialY;
      ySpeed = 0;
      floating = false;
    }
  }
}
