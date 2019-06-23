// Create an array of water elements to combine them into the sea visualisation. 
// To each index of the array the MSD effect is applied, and the index' neighbours affect the sum of the force applied on it.
// Upon click, a force is applied to the column underneath the boat, as well as to its neighbours.
// Robin Venhuizen and Thomas van Wanrooij, 2019

class Ocean {
  Water [] water = new Water[140];
  float columnChoice;

  Ocean() {
    for (int i = 0; i<water.length; i++) {
      water[i] = new Water(7*i-40);
    }
  }

  // Runs methods of the ocean
  void run() {
    for (int i = 1; i < water.length-1; i++) {   
      water[i].MSD(); // Call the MSD system from class Water
      water[i].neighbourForce =  ((water[i].yPos - water[i-1].yPos) + (water[i].yPos - water[i+1].yPos)) * water[i].constant; //Calculate the difference in height from both neighbouring water
      water[i].force += water[i].neighbourForce; // Update the force with the info calculated from its neighbours
    }

    // Checks if the boat is at or below water level
    if (boat.boatPos.y >= water[int(columnChoice)].yPos) {
      boat.floating = true;
    }
    if (boat.floating == true) { // When at or below water level, boat starts moving to the right.
      boat.boatPos.y = water[int(columnChoice)].yPos-40; // Boat height in screen follows the height of the water, -40 is a correction for the size of the image.
      boat.boatSpeed.y = 0;
      boat.boatSpeed.x = 1; // Add horizontal speed
    }
    if (int(columnChoice) > water.length) { // When the boat reaches the edge of the water, its reset function is called.
      boat.reset();
      boat.floating = false;
    }
  }

  // Calculate which columns should have force added to them with water[i].mouse()
  void click() {
    // Map the boat's x-position to one of the columns of water. 
    // The boat follows the position of the initial column it is above, to create a smoother effect than when it follows the position of the column it is actually above when moving
    columnChoice = map(boat.boatPos.x, -40, width+140, 0, water.length); 
    if (!boat.floating) {
      for (int i = 0; i < water.length; i++) {
        water[int(columnChoice)].mouse(); // Update column below the boat with the new force to restart effect
        water[int(columnChoice)+1].mouse(); // Update one right of the chosen column with the new force to restart effect
        water[int(columnChoice)-1].mouse(); // Update one left of the chosen column with the new force to restart effect
      }
    }
  }
}
