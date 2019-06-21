//Robin Venhuizen and Thomas van Wanrooij, 2019
//Sky image taken from: http://www.clker.com/clipart-sky-.html

Water [] water = new Water[117];
Boat boat;
Flock flock;
float ballChoice;
boolean floating;
PImage boatImg;
PImage sky;
PImage floorfg;
PImage floorbg;

void setup() {
  size(800, 800); //Window size
  smooth(); //adds anti aliasing
  sky = loadImage("sky.jpg");
  floorfg = loadImage("floorfg.png");
  floorbg = loadImage("floorbg.png");

  boat = new Boat(width/2, 300); 
  for (int i = 0; i<water.length; i++) {
    water[i] = new Water(7*i-5);
  }
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 100; i++) {
    Boid b = new Boid(width/2, height);
    flock.addBoid(b);
  }
}
void draw() {
  background(255);
  imageMode(CORNER);
  image(sky, 0, 0);
  image(floorbg, 0, height/2);
  //fill(255, 40);
  //rect(0, 0, width, height);
  //background(255); // Black background

  boat();
  flock.run();
  imageMode(CORNER);
  image(floorfg, 0, height/2);

  for (int i = 1; i < water.length-1; i++) {   
    water[i].MSD(); // Call the MSD system from class Water
    water[i].neighbourForce =  ((water[i].yPos - water[i-1].yPos) + (water[i].yPos - water[i+1].yPos)) *water[i].constant; //Calculate the difference in height from both neighbouring water
    water[i].force += water[i].neighbourForce; // Update the force with the info calculated from its neighbours

    if (boat.boatPos.y > water[int(ballChoice)].yPos) {
      floating = true;
    }
    if (floating == true) {
      boat.boatPos.y = water[int(ballChoice)].yPos-40;
      boat.boatSpeed.y = 0;
      boat.boatSpeed.x = 1;
    }
    if (int(ballChoice) > water.length) {
      boat.reset();
      floating = false;
    }
  }
}

void mouseClicked() {
  ballChoice = map(boat.boatPos.x, 0, width, 0, water.length);
  for (int i = 0; i < water.length; i++) {
    water[int(ballChoice)].mouse(); // Update middle ball with the new force to restart effect
    water[int(ballChoice)+1].mouse(); // Update one right of the middle ball with the new force to restart effect
    water[int(ballChoice)-1].mouse(); // Update one left of the middle ball with the new force to restart effect
  }

  boat.click();
}

void boat() {

  boat.display();
  boat.reset();
  if (floating == false) {
    boat.boatPos.x = mouseX;
  }
}
