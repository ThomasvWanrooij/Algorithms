float line; //Length of the line
float angle = PI/1.5; //Starting angle (position)
float speed;
float accel;
float friction = 0.998; //Friction factor
float gravity = 0.5; //Acceleration through gravity simulation
PVector ballPos;
PVector start;

class Ball {

  Ball(PVector initStart, float initLine) {
    line = initLine;
    start = initStart;
    ballPos = new PVector();
  }

  void display() {
    accel = (-1 * gravity / line ) * sin(angle); //Acceleration based on the (inverted) gravity, taking into account the angle of the object

    speed += accel; //Updating of acceleration 
    speed *= friction; //Factoring in the friction value to the speed (decreasing speed as result)
    angle += speed; //Angular position with speed update

    ballPos.set(line*sin(angle), line*cos(angle)); //New position, taking angle into account
    ballPos.add(start); //Add starting position
    
    //Draw figure
    fill(255);
    ellipse(ballPos.x, ballPos.y, 50, 50);
    stroke(255);
    strokeWeight(4);
    line(width/2, 0, ballPos.x, ballPos.y);
  }
}
