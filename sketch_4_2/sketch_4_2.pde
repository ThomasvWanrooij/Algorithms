// Robin Venhuizen and Thomas van Wanrooij, 2019
// Adapted code of Daniel Shiffman

ArrayList<Particle> particles;

void setup() {
  size(640, 360, P3D);
  particles = new ArrayList<Particle>();
}

void draw() {
  background(255);

  // Looping through backwards to delete
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.run();
    if (p.isDead()) {
      particles.remove(i);
    }
  }
} 

void mousePressed() {
  for (int i = 0; i < 50; i++) {
    particles.add(new Particle(new PVector(mouseX, mouseY)));
  }
}
