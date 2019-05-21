// Robin Venhuizen and Thomas van Wanrooij, 2019
// Adapted code of Daniel Shiffman

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  int num;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.2);
    velocity = new PVector(random(-4, 4), random(-5, 0));
    position = l.copy();
    lifespan = 255.0;
    num = int(random(0, 3));
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 2.0;
  }

  // Method to display
  void display() {
    stroke(0, lifespan);
    strokeWeight(0.5);
    fill(255, 255-lifespan, 0, lifespan);
    shapes();
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }

  void shapes() {
    if (num == 0) {
      ellipse(position.x, position.y, 12, 12);
    } else if (num == 1) {
      rect(position.x, position.y, 12, 12);
    } else {
      ellipse(position.x, position.y, 5, 20);
    }
  }
}
