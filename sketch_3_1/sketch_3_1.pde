PVector pos;
PVector speed;
PVector gravity;
PVector force;

void setup() {
  size(500, 500);
  background(0);
  noStroke();
  force = new PVector(30, -20);
  speed = new PVector(force.x, force.y);
  gravity = new PVector(0, 9.81);
  pos = new PVector(20, 100);
}

void draw() {
  fill(255, 0, 0);
  speed = speed.add(gravity);
  pos = pos.add(speed);
  ellipse(pos.x, pos.y, 15, 15);
}
