class Rocket {
  Particle particle1;
  ArrayList<Particle> particles;
  PVector rocketPos;
  PVector speed;
  PVector accel;

  Rocket() {
    particles = new ArrayList<Particle>();
    rocketPos = new PVector(width/2, height-65);
    speed = new PVector(0, 0);
    accel = new PVector(0, -0.2);
  }

  void run() {
    particles.add(new Particle(new PVector(rocketPos.x, rocketPos.y+45)));

    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.display();
      if (p.Dead()) {
        particles.remove(i);
      }
    }

    speed.add(accel);
    rocketPos.add(speed); 
    image(img, rocketPos.x, rocketPos.y, 75, 131);
  }
}
