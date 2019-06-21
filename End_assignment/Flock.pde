// Create an ArrayList of boids that can be added upon mouse drag, and are removed when in vincinity of the cup.
// Original code used from:
// The Nature of Code, Daniel Shiffman. http://natureofcode.com
// Added a remove function to 'kill fish' by
// Robin Venhuizen and Thomas van Wanrooij, 2019

class Flock {
  ArrayList<Boid> boids; // An ArrayList for all the boids

  Flock() {
    boids = new ArrayList<Boid>(); // Initialize the ArrayList
  }

  // Runs methods of the flock
  void run() {
    for (Boid b : boids) {
      b.run(boids);  // Passing the entire list of boids to each boid individually
    }
    removeBoid();
  }

  // Add boids
  void addBoid(Boid b) {
    boids.add(b);
  }

  // Self-written code to remove boids when close enough to the cup
  void removeBoid() {
    for (int i = boids.size()-1; i >= 0; i--) {
      Boid b = boids.get(i);
      if ( dist(b.position.x, b.position.y, cup.pos.x, cup.pos.y) < 40) {
        boids.remove(i);
      }
    }
  }
  
  // Spawn boids on mouse position
  void spawn(float xMouse, float yMouse) {
    if (yMouse > height/2) {
      flock.addBoid(new Boid(xMouse, yMouse));
    }
  }
}
