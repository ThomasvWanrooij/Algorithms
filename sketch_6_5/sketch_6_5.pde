//Robin Venhuizen and Thomas van Wanrooij, 2019

Ball [] balls = new Ball[116];

void setup() {
  size(800, 800); //Window size
  background(0); // Black background
  smooth(); // Smoothens the visual appearance
  for (int i = 0; i<balls.length; i++) {
    balls[i] = new Ball(7*i-3);
  }
}

void draw() {
  fill(0, 40);
  rect(0, 0, width, height);
  for (int i = 1; i < balls.length-1; i++) {   
    balls[i].MSD(); // Call the MSD system from class Ball
    balls[i].neighbourForce =  ((balls[i].yPos - balls[i-1].yPos) + (balls[i].yPos - balls[i+1].yPos)) *balls[i].constant; //Calculate the difference in height from both neighbouring balls
    balls[i].force += balls[i].neighbourForce; // Update the force with the info calculated from its neighbours
  }
}

void mouseClicked() {
  for (int i = 0; i < balls.length; i++) {
    balls[balls.length/2].mouse(); // Update middle ball with the new force to restart effect
  }
}
