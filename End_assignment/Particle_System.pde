// Create an ArrayList of particles
// Robin Venhuizen and Thomas van Wanrooij, 2019

class  ParticleSystem {
  Particle particle;
  ArrayList<Particle> particles;


  ParticleSystem() {
    particles = new ArrayList<Particle>();
  }

  // Runs the particle system
  void run() {
    particles.add(new Particle(new PVector(boat.boatPos.x-95, boat.boatPos.y+47))); // Add new particle 

    for (int i = particles.size()-1; i >= 0; i--) { // Gets particle at index i and if its lifespan is over, it is removed
      Particle particle = particles.get(i);
      particle.run();
      if (particle.timeUp()) {
        particles.remove(i);
      }
    }
  }
}
