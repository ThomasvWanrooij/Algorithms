// each of these subclasses of Screen
// defines one state of the statemachine
//Changed by Robin Venhuizen and Thomas van Wanrooij, 2019

class State5 extends Screen {
  ArrayList<Particle> particles;
  State5(ScreenState[] nextStates) {
    super(nextStates);

    particles = new ArrayList<Particle>();
  }

  void draw() {
    background(80);

    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      p.colour = color(255-p.lifespan, 255-p.lifespan, 255);
      if (p.isDead()) {
        particles.remove(i);
      }
    }
    for (int i = 0; i < 20; i++) {
      particles.add(new Particle(new PVector(50, height-20)));
      particles.add(new Particle(new PVector(width-50, height-20)));
    }

    fill(255);
    textSize(40);
    textMode(CENTER);
    text("You win!", 150, height/2-50);
    text("Press R to restart", 80, height/2);
  }

  void reset() {
    // empty
  }

  void handleKeyPress() {
    // called by keyPressed() from main
    // conditional transition to a successor state - here with an interaction condition
    // also, here are two different possible successor states

    if (key == 'r' || key == 'R') {
      goToState(nextStates[0]);
    }
  }
}
