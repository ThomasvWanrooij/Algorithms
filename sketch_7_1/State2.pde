// each of these subclasses of Screen
// defines one state of the statemachine
//Changed by Robin Venhuizen and Thomas van Wanrooij, 2019

class State2 extends Screen {
  ArrayList<Particle> particles;
  State2(ScreenState[] nextStates) {
    super(nextStates);
    particles = new ArrayList<Particle>();
  }

  void draw() {
    background(0);
    fill(255);
    text("let's play with fire", 20, 20);
    text("if you're done press a key", 20, 40);
    //Assignment 4_2
    // Looping through backwards to delete
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      p.colour = color(255, 255-p.lifespan, 0, p.lifespan); // set the colour of the particles
      if (p.isDead()) {
        particles.remove(i);                                //remove particles when invisible
      }
    }
    for (int i = 0; i < 50; i++) {
      if (mousePressed) {
        particles.add(new Particle(new PVector(mouseX, mouseY)));    // if mouse is pressed create 50 particles each frame
      }
    }
  }

  void reset() {
    // empty
  }

  void handleKeyPress() {
    // called by keyPressed() from main
    // conditional transition to a successor state - here with an interaction condition
    goToState(nextStates[0]);
  }
}
