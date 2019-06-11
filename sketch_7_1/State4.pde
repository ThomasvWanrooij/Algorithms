// each of these subclasses of Screen
// defines one state of the statemachine
//Changed by Robin Venhuizen and Thomas van Wanrooij, 2019

class State4 extends Screen {
  int points;
  int timer;
  Ball [] balls1 = new Ball[7];

  State4(ScreenState[] nextStates) {
    super(nextStates);
    for (int i = 0; i<=balls1.length-1; i++) {
      balls1[i] = new Ball(0.5*i, 100 + 50*i);
    }
  }

  void draw() {
    background(0);
    textSize(20);
    text("Quick don't get distracted! press a key " + MAX_POINTS_4 + " times", 20, 20);
    fill(255, 0, 0);
    textSize(30);
    textMode(CENTER);
    text(TIME_GAME_4 - (millis()-timer), width/2-30, 60); // countdown
    textSize(20);
    text(points, 20, 80);

    //Assignment 6_4
    fill(0, 50);
    rect(0, 0, width, height);
    for (int i = 0; i < balls1.length-1; i++) {
      balls1[i].display();
    }

    // conditional transition to a successor state - here with a threshold condition
    // and also two different possible successor states 

    if (millis() - timer > TIME_GAME_4) {
      goToState(nextStates[1]);
    }

    if (points >= MAX_POINTS_4) {
      goToState(nextStates[0]);
    }
  }

  void reset() {
    points = 0;
    timer = millis();
  }

  void handleKeyPress() {
    // called by keyPressed() from main
    points++;
    for (int i = 0; i < balls1.length-1; i++) {
      balls1[i].key();
    }
  }
}
