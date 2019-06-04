//Made by Robin Venhuizen and Thomas van Wanrooij
//Inspired by the nature of code chapter 3 by Daniel Shiffman
//https://natureofcode.com/book/chapter-3-oscillation/

Ball ball1;

void setup() {
  size (800, 800);
  ball1 = new Ball(new PVector(height/2,0), 700); //Create new instance of Ball
}

void draw() {
  background(0);
  ball1.display();
}
