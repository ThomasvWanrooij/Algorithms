// Display and move a Starbucks cup image to represent trash in the ocean.
// #SaveTheTurtles
// Robin Venhuizen and Thomas van Wanrooij, 2019
// Original image taken from: https://www.amazon.in/Grande-16oz-Starbucks-Cold-Cup/dp/B0029DDJEK

class Cup {
  PImage cup;
  PVector pos;
  PVector velocity;
  float xoff;
  float yoff;
  float toff;

  Cup() {
    cup = loadImage("cup.png");
    pos = new PVector(width/2, height/2+100);
    velocity = new PVector(0.004, 0.004);
  }

  // Runs methods of the cup
  void run() {
    display();
    addNoise();
  }
  
  // Create and rotate image of the cup
  void display() {
    pos.add(velocity);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(noise(toff)*5);
    imageMode(CENTER);
    image(cup, 0, 0, 68, 120);
    popMatrix();
  }

  // Perlin noise added to the postition of the cup to apply randomness to its position
  void addNoise() {
    pos.x = noise(xoff)*width;
    pos.y = (noise(0, yoff)*height/2)+height/2;

    xoff += 0.003;
    yoff += 0.001;
    toff += 0.005;
  }
}
