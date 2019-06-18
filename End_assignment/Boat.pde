class Boat {

  float xPos;
  float yPos;
  float ySpeed;
  float xSpeed;
  float initialY;

  Boat(float initX, float initY) {
    initialY = initY;
    xPos = initX;
    yPos = initY;
  }

  void display() {
    fill(255, 0, 0);
    yPos += ySpeed;
    ellipse(xPos, yPos, 30, 30);
    fill(0, 40);
    rect(0, 0, width, height);
  }

  void click() {
    ySpeed = 20;
  }

  void reset() {
    if (yPos > height) {
      yPos = initialY;
      ySpeed = 0;
    }
  }
}
