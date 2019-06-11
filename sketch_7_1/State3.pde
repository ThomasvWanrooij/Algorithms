// each of these subclasses of Screen
// defines one state of the statemachine
//Changed by Robin Venhuizen and Thomas van Wanrooij, 2019

class State3 extends Screen {
  int cols, rows;
  int scl = 20;
  int w = 2000;
  int h = 1600;

  float bird = 0;

  float [][] planet;
  State3(ScreenState[] nextStates) {
    super(nextStates);
    cols = w / scl;
    rows = h / scl;
    planet = new float[cols][rows];
  }

  void draw() {
    background(255, 215, 0);
    fill(238, 120, 238);
    text("Press G to continue, or press something else... \nyour choice", 20, 20);
    bird -= 0.2;

    float yoff = bird;
    for (int y = 0; y < rows; y++) {
      float xoff = 0;
      for (int x = 0; x < cols; x++) {
        planet[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
        xoff += 0.2;
      }
      yoff += 0.2;
    }

    stroke(238, 120, 238);
    strokeWeight(2);
    fill(0);

    translate(width/2, height/2);
    rotateX(PI/3);
    translate(-w/2, -h/2);
    for (int y = 0; y<rows-1; y++) {
      beginShape(TRIANGLE_STRIP);
      for (int x = 0; x < cols; x++) {
        vertex(x*scl, y*scl, planet[x][y]);
        vertex(x*scl, (y+1)*scl, planet[x][y+1]);
      }
      endShape();
    }
  }

  void reset() {
    // empty
  }

  void handleKeyPress() {
    // called by keyPressed() from main
    // conditional transition to a successor state - here with an interaction condition
    // also, here are two different possible successor states

    if (key == 'g' || key == 'G') {
      goToState(nextStates[0]);
    } else {
      goToState(nextStates[1]);
    }
  }
}
