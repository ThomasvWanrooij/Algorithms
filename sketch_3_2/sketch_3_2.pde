//Made by Robin Venhuizen and Thomas van Wanrooij, 2019

PVector pos;
PVector speed;
PVector gravity;
PVector force;
int drawX;
int drawY;
int posX = 100;
int posY = 100;

void setup() {
  size(500, 500);
  background(220);
  gravity = new PVector(0, 9.81);
  pos = new PVector(posX, posY);
}

void draw() {
  noStroke();
  fill(255, 0, 0);
  ellipse(posX, posY, 15, 15);

  if (mousePressed) {
    if (mouseY > 200) {
      drawY = -100;
    } else {
      drawY = posY-mouseY;
    }
    drawX = posX-mouseX;
    
    force = new PVector(drawX, drawY);
    speed = new PVector(force.x, force.y);

    while (pos.y < height) {
      speed = speed.add(gravity);
      pos = pos.add(speed);
      ellipse(pos.x, pos.y, 15, 15);
    }
  }
  stroke(2);
  fill(139, 69, 19);
  rect(posX-5, posY-10, 10, 45);
  fill(193, 94, 64);
  rect(posX-5, posY+15, 10, 45);
}
