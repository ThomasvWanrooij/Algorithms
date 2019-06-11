//Robin Venhuizen and Thomas van Wanrooij, 2019

Ball [] balls = new Ball[116];

void setup() {
  size(800, 800);
  background(0);
  smooth();
  for (int i = 0; i<balls.length; i++) {
    balls[i] = new Ball(7*i-3);
  }
}

void draw() {
  fill(0, 40);
  rect(0, 0, width, height);
  for (int i = 1; i < balls.length-1; i++) {   

    balls[i].calculate();
    balls[i+1].velocity = (balls[i].yPos - balls[i+1].yPos) * balls[i+1].constant;
    balls[i-1].velocity = (balls[i].yPos - balls[i-1].yPos) * balls[i-1].constant;
    balls[i].display();
  }
}

void mousePressed() {
  for (int i = 0; i < balls.length; i++) {
    balls[balls.length/2].mouse();
  }
}
