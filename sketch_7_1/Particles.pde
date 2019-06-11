// Particles class for state 2
// Robin Venhuizen and Thomas van Wanrooij, 2019
// Adapted code of Daniel Shiffman

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  int num;
  color colour;


  Particle(PVector l) {
    acceleration = new PVector(0, -0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
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
    noStroke();
    strokeWeight(0.5);
    fill(colour);
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
