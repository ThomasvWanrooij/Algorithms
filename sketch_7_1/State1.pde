// each of these subclasses of Screen
// defines one state of the statemachine
//Changed by Robin Venhuizen and Thomas van Wanrooij, 2019

class State1 extends Screen {
  int timer;
  float xoff = 0.0;
  float yoff;
  float xincrement = 0.01;
  float yincrement= 0.01;

  State1(ScreenState[] nextStates) {
    super(nextStates);
  }

  void draw() {
    textSize(20);
    text("Here we can see an ellipse in it's natural habitat", 20, 20);
    int timeToGo = (TIME_GAME_1 - millis() + timer) / 1000;
    text( timeToGo, width/2, 50);

    //Assignment 2_5
    // Create an alpha blended background
    fill(0, 10);
    rect(0, 0, width, height);
    noStroke();

    // Get a noise value based on xoff and scale it according to the window's width
    float x = noise(xoff)*width;
    // Get a noise value based on yoff and scale it according to the window's height
    float y = noise(0, yoff)*height;

    // With each cycle, increment xoff and yoff
    xoff += xincrement;
    yoff += yincrement;

    // Draw the ellipse at the value produced by perlin noise
    fill(200);
    ellipse(x, y, 64, 64);


    // conditional transition to a successor state - here with a timer condition
    if ((millis() - timer) > TIME_GAME_1) { 
      goToState(nextStates[0]);
    }
  }

  void reset() {
    timer = millis();
  }
}
