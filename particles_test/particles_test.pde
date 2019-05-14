Particle particle1;
ArrayList<Particle> particles;


void setup() {
  size(500, 500);
  particles = new ArrayList<Particle>();
}

void draw() {
  background(255);
  particles.add(new Particle(new PVector(width/2,50)));


  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.display();
    if (p.Dead()) {
      particles.remove(i);
    }
  }
  println(particles.size());
 
}
