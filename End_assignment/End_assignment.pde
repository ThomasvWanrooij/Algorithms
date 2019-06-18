//Robin Venhuizen and Thomas van Wanrooij, 2019

Ball [] balls = new Ball[116];
Boat boat;
float yPosition = 50;

void setup() {
  size(800, 800); //Window size
  background(0); // Black background
  smooth(); // Smoothens the visual appearance
  boat = new Boat(width/2, 50); 
  for (int i = 0; i<balls.length; i++) {
    balls[i] = new Ball(7*i-3);
  }
}

void draw() {
  for (int i = 1; i < balls.length-1; i++) {   
    balls[i].MSD(); // Call the MSD system from class Ball
    balls[i].neighbourForce =  ((balls[i].yPos - balls[i-1].yPos) + (balls[i].yPos - balls[i+1].yPos)) *balls[i].constant; //Calculate the difference in height from both neighbouring balls
    balls[i].force += balls[i].neighbourForce; // Update the force with the info calculated from its neighbours
  }
  boat();
}

void mouseClicked() {
  for (int i = 0; i < balls.length; i++) {
    float balldist = balls[i].yPos - boat.yPos;
    if (balldist < 20) {
      float ballChoice = map(boat.xPos, 0, width, 0, balls.length);
      balls[int(ballChoice)].mouse(); // Update middle ball with the new force to restart effect
    }
  }

  boat.click();
}

void boat() {
  
  boat.display();
  boat.reset();
  boat.xPos = mouseX;
}
