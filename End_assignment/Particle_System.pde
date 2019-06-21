class  ParticleSystem{
  Particle particle;
  ArrayList<Particle> particles;
  PVector speed;
  PVector accel;

  ParticleSystem() {
    particles = new ArrayList<Particle>();
    //rocketPos = new PVector(width/2, height-65);
    speed = new PVector(0, 0);
    accel = new PVector(0, -0.2);
  }

  void run() {
    particles.add(new Particle(new PVector(boat.boatPos.x-95, boat.boatPos.y+47)));

    for (int i = particles.size()-1; i >= 0; i--) {
      Particle particle = particles.get(i);
      particle.display();
      if (particle.alive()) {
        particles.remove(i);
      }
    }
  }
}
