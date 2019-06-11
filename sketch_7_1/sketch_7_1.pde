/* 
 * This is an example for a state machine schema
 * for the course "Algorithms for Creative Technology"
 * David Stritzl & Angelika Mader
 * April 2017
 * Processing 3.3
 */
 
 //Changed by Robin Venhuizen and Thomas van Wanrooij, 2019
 //states changed and 1 extra added

import java.util.*;

ScreenStateMachine stateMachine;


void setup() {
  size(500, 500, P3D);
  background(0);
  smooth();

  Map<ScreenState, Screen> screens = new HashMap<ScreenState, Screen>();

  // the following sets up the structure of the state machine in the game
  // first, it matches the names of the ScreenStates to the instances of the game phase
  // second, it defines the list of successor screens for each screen (game phase)
  screens.put(ScreenState.STATE_1, new State1(new ScreenState[] {ScreenState.STATE_2}));
  screens.put(ScreenState.STATE_2, new State2(new ScreenState[] {ScreenState.STATE_3}));
  screens.put(ScreenState.STATE_3, new State3(new ScreenState[] {ScreenState.STATE_4, ScreenState.STATE_2}));
  screens.put(ScreenState.STATE_4, new State4(new ScreenState[] {ScreenState.STATE_5, ScreenState.STATE_3}));
  screens.put(ScreenState.STATE_5, new State5(new ScreenState[] {ScreenState.STATE_1}));

  stateMachine = new ScreenStateMachine(screens, ScreenState.STATE_1); 


}

void draw() {
  stateMachine.doAvailableTransitions();
  stateMachine.drawScreen();
}

void keyPressed() {
  stateMachine.handleKeyPress();
}

void mousePressed() {
  stateMachine.handleMousePress();
}
