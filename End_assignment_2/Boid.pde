// Methods for Separation, Cohesion, Alignment
// Avoid added by Robin Venhuizen and Thomsa van Wanrooij, 2019

class Boid {
  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector boatVector;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  PVector obstacle;
  float obstdist;
  float obstsize = 30;

  Boid(float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    position = new PVector(x, y);
    obstacle = new PVector(300, 600);
    boatVector = new PVector(boat.boatPos.x,boat.boatPos.y); 
    maxspeed = 3;
    maxforce = 0.05;
  }

  void run(ArrayList<Boid> boids) {
    flock(boids);
    update();
    borders();
    render();
    obstacle();
  }

  void obstacle() { // draw the buoy
    //fill(255, 0, 0);
    //stroke(1);
    //ellipse(obstacle.x, obstacle.y, obstsize, obstsize);
    //strokeWeight(5);
    //stroke(255);
    //line(obstacle.x-obstsize/4-2, obstacle.y-obstsize/4-2, obstacle.x+obstsize/4+2, obstacle.y+obstsize/4+2);
    //line(obstacle.x+obstsize/4+2, obstacle.y-obstsize/4-2, obstacle.x-obstsize/4-2, obstacle.y+obstsize/4+2);
    //strokeWeight(1);
    //fill(0,119,190);
    //stroke(0);
    //ellipse(obstacle.x,obstacle.y,obstsize/1.8,obstsize/1.8);
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  // We accumulate a new acceleration each time based on three rules
  void flock(ArrayList<Boid> boids) {
    PVector sep = separate(boids);   // Separation
    PVector ali = align(boids);      // Alignment
    PVector coh = cohesion(boids);   // Cohesion
    PVector avo = avoid(boids);      //avoid
    // Arbitrarily weight these forces
    sep.mult(1.5);
    ali.mult(1.0);
    coh.mult(1.0);
    avo.mult(1.5);
    // Add the force vectors to acceleration
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
    applyForce(avo);
  }

  // Method to update position
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    position.add(velocity);
    // Reset accelertion to 0 each cycle
    acceleration.mult(0);
  }

  // A method that calculates and applies a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, position);  // A vector pointing from the position to the target
    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.mult(maxspeed);
    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    return steer;
  }

  void render() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + radians(90);
    fill(255, 176, 66);
    stroke(0);
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    triangle(0, 0, -4, 8, 4, 8);
    ellipse(0, 0, 5, 10);
    noStroke();
    fill(255);
    ellipse(0, 0, 2, 5);
    popMatrix();
  }

  // bounce
  void borders() {
    if (position.x < 0 || position.x > width) { 
      velocity.x = velocity.x * -1;
    }
    if (position.y < height/2+5 || position.y > height) {
      velocity.y = velocity.y * -1;
    }
  }

  // Separation
  // Method checks for nearby boids and steers away
  PVector separate (ArrayList<Boid> boids) {
    float desiredseparation = 16.0f;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(position, other.position);
        diff.normalize();
        diff.div(d);        // Weight by distance
        steer.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      steer.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(velocity);
      steer.limit(maxforce);
    }
    return steer;
  }

  //code used to avoid the buoy  
  PVector avoid (ArrayList<Boid> boids) {
    float separation = 250f;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    
    // For every boid in the system, check if it's too close
    for (Boid other : boids) {
      float obstdist = PVector.dist(boatVector, position);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((obstdist > 0) && (obstdist < separation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(position, boatVector);
        diff.normalize();
        diff.div(obstdist);        // Weight by distance
        steer.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      steer.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(velocity);
      steer.limit(maxforce);
    }
    return steer;
  }
  
  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  PVector align (ArrayList<Boid> boids) {
    float neighbordist = 15;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.velocity);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxforce);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }

  // Cohesion
  // For the average position (i.e. center) of all nearby boids, calculate steering vector towards that position
  PVector cohesion (ArrayList<Boid> boids) {
    float neighbordist = 30;
    PVector sum = new PVector(0, 0);   // Start with empty vector to accumulate all positions
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.position); // Add position
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);  // Steer towards the position
    } else {
      return new PVector(0, 0);
    }
  }
}
