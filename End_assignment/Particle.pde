// Create one instance of a particle
// Particle has a lifespan 
// Robin Venhuizen and Thomas van Wanrooij, 2019

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

  //Runs methods of the particle
  void run() {
    display();
    force();
  }

  // Draw the particle and give it a lifespan to fade out
  void display() {
    float size = map(life, 0, 255, 2, 7);
    noStroke();
    fill(55, 95, 135, life);
    ellipse(pos.x, pos.y, size, size);
    life -= 7;
  }

  // Position and speed of the particles are updated
  void force() {
    speed.add(accel);
    pos.add(speed);
  }

  // Checks if particle should still be present according to its lifespan
  boolean timeUp() {
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }
}
