class Particle {
  PVector pos;
  PVector speed;
  PVector accel;
  int life = 255;

  Particle(PVector initPos) {
    pos = initPos.copy();
    speed = new PVector(random(-7, -2), random(-7, -15));
    accel = new PVector(0, 0.5);
  }
  void display() {
    speed.add(accel);
    pos.add(speed);
    float size = map(life, 0, 255, 2, 7);
    noStroke();
    fill(55, 95, 135, life);
    ellipse(pos.x, pos.y, size, size);
    life -= 7;
  }

  boolean alive() {
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }
}
