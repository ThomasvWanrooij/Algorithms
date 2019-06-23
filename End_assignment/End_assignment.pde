// An interactive display of a boat sailing on a water surface, while fish swim below.
// The fish swim through the coral, and are killed by the plastic cup in the ocean.
// When you click the mouse, the boat is dropped into the water with a splash. It will slowly sail away.
// To sustain a healthy population of fish, you can respawn fish by dragging the mouse in the water.
// Robin Venhuizen and Thomas van Wanrooij, 2019
// Sky image taken from: http://www.clker.com/clipart-sky-.html
// Seaweed images taken from: http://gclipart.com/seaweed-clipart_23252/, https://www.kisspng.com/png-cartoon-seabed-clip-art-cartoon-ocean-floor-552717/, https://www.kisspng.com/png-seagrass-cartoon-cartoon-seaweed-475653/ and http://www.clipartpanda.com/clipart_images/clipart-clip-art-seaweed-56750844

PImage boatImg;
PImage sky;
PImage floorfg;
PImage floorbg;

Boat boat;
Flock flock;
Ocean ocean;
Cup cup;

boolean floating;

void setup() {
  size(800, 800); // Window size
  smooth(); // Add anti aliasing
  sky = loadImage("sky.jpg");
  floorfg = loadImage("floorfg.png");
  floorbg = loadImage("floorbg.png");

  boat = new Boat(width/2, 333);
  flock = new Flock();
  ocean = new Ocean();
  cup = new Cup();

  // Add an initial set of boids into the system
  for (int i = 0; i < 100; i++) {
    Boid b = new Boid(width/2, height);
    flock.addBoid(b);
  }
}

void draw() {
  // Draw the setting of the interactive program
  background(255);
  imageMode(CORNER);
  image(sky, 0, 0);
  image(floorbg, 0, height/2);

  // Run all the classes
  boat.run(mouseX);
  flock.run();
  cup.run();
  imageMode(CORNER);
  image(floorfg, 0, height/2);
  ocean.run();
}

// Activate click methods when the mouse is clicked
void mousePressed() {
  ocean.click();
  boat.click();
}

// Spawn boids on mouse position with a mouse drag
void mouseDragged() {
  flock.spawn(mouseX, mouseY);
}
