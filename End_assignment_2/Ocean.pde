float ballChoice;
class Ocean {
  Water [] water = new Water[140];

  Ocean() {
    for (int i = 0; i<water.length; i++) {
      water[i] = new Water(7*i-40);
    }
  }

  void run() {
    for (int i = 1; i < water.length-1; i++) {   
      water[i].MSD(); // Call the MSD system from class Water
      water[i].neighbourForce =  ((water[i].yPos - water[i-1].yPos) + (water[i].yPos - water[i+1].yPos)) *water[i].constant; //Calculate the difference in height from both neighbouring water
      water[i].force += water[i].neighbourForce; // Update the force with the info calculated from its neighbours
    }

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

  void click() {
    ballChoice = map(boat.boatPos.x, -40, width+140, 0, water.length);
    for (int i = 0; i < water.length; i++) {
      water[int(ballChoice)].mouse(); // Update middle ball with the new force to restart effect
      water[int(ballChoice)+1].mouse(); // Update one right of the middle ball with the new force to restart effect
      water[int(ballChoice)-1].mouse(); // Update one left of the middle ball with the new force to restart effect
    }
  }
}
