//Robin Venhuizen and Thomas van Wanrooij, 2019
//Sky image taken from: http://www.clker.com/clipart-sky-.html
//Seaweed images taken from: http://gclipart.com/seaweed-clipart_23252/, https://www.kisspng.com/png-cartoon-seabed-clip-art-cartoon-ocean-floor-552717/, https://www.kisspng.com/png-seagrass-cartoon-cartoon-seaweed-475653/ and http://www.clipartpanda.com/clipart_images/clipart-clip-art-seaweed-56750844

Boat boat;
Flock flock;
Ocean ocean;
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
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 200; i++) {
    Boid b = new Boid(width/2, height);
    flock.addBoid(b);
  }
  boat = new Boat(width/2, 333);
  ocean = new Ocean();
}
void draw() {
  background(255);
  imageMode(CORNER);
  image(sky, 0, 0);
  image(floorbg, 0, height/2);
  boat.run(mouseX);
  flock.run();
  imageMode(CORNER);
  image(floorfg, 0, height/2);
  ocean.run();
}

void mouseClicked() {
  ocean.click();
  boat.click();
}
