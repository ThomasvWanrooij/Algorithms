class Particle {
  PVector pos;
  PVector speed;
  PVector accel;
  int life = 255;

  Particle(PVector l) {
    pos = l.copy();
    speed = new PVector(random(-3, 3), 0);
    accel = new PVector(0, 0.5);
  }

  void display() {
    speed.add(accel);
    pos.add(speed);
    noStroke();
    fill(255, 255-life, 0, life);
    float size = map(life, 0, 255, 5, 14);
    ellipse(pos.x, pos.y, size, size);
    life-= 7;
  }

  boolean Dead() {
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }
}
