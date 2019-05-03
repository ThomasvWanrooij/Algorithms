class Confetti {
  
  color c;        // a confetti has a colour
  //float ballPos.x;     // a confetti has an x-position
  //float ballPos.y;     // a confetti has an y-position
  float radius;    // a confetti has a radius;
  //float ballSpeed.x;       // the confetti moves with some speed in x direction
  //float ballSpeed.y;       // the confetti moves with some speed in y direction
  int id;         // a confetti knows here its number
  PVector ballPos, ballSpeed, centers, a, b;
  
  Confetti(int j) {  //constructor: gives values to the variables
    c= color(int(random(180,255)), int(random(0,150)), int(random(100,200)));  //pinkish
    
    radius=random(10,25);
   // ballPos.x=int(random(radius,width-radius));
   // ballPos.y=int(random(radius,width-radius));
    
    ballPos = new PVector(int(random(radius,width-radius)),int(random(radius,width-radius)));
    ballSpeed =  new PVector(int(random(-3,4)),int(random(-3,4)));
   
    
    
    //ballSpeed.x=int(random(-3,4));               // speed in x-direction
    while (ballSpeed.x==0) ballSpeed.x=int(random(-3,4)); // dont want nonmoving confettis
    //ballSpeed.y=int(random(-3,4));               // speed in y-direction
    while (ballSpeed.y==0) ballSpeed.y=int(random(-3,4)); // dont want nonmoving confettis
    
    id=j;
  }
    
  void draw_confetti() {
    //noStroke();
    fill(c);
    ellipse(ballPos.x,ballPos.y,2*radius,2*radius);
  }
  
  void move_confetti() {
    //if the confetti reaches the left wall or the right wall, it bounces
    if ((ballPos.x>width-radius-ballSpeed.x) || (ballPos.x<radius-ballSpeed.x))  ballSpeed.x=-ballSpeed.x;
    //ballPos.x=ballPos.x+ballSpeed.x;
    //if the confetti reaches the top wall or the botton wall, it bounces
    if ((ballPos.y>height-radius-ballSpeed.y) || (ballPos.y<radius-ballSpeed.y))  ballSpeed.y=-ballSpeed.y;
   // ballPos.y=ballPos.y+ballSpeed.y;
   ballPos.add(ballSpeed);
  }
  
  void collide() {
    // compare each confetti with all confettis having a higher index
    // where the actual highest index is i
    for (int j = id + 1; j < i; j++) {
      //float centers.x = confs[j].ballPos.x+confs[j].ballSpeed.x - ballPos.x-ballSpeed.x;
      //float centers.y = confs[j].ballPos.y+confs[j].ballSpeed.y - ballPos.y-ballSpeed.y;
      centers = new PVector(confs[j].ballPos.x+confs[j].ballSpeed.x - ballPos.x-ballSpeed.x, confs[j].ballPos.y+confs[j].ballSpeed.y - ballPos.y-ballSpeed.y);
      float distance = sqrt(centers.x*centers.x + centers.y*centers.y);
      a = new PVector((ballSpeed.x*(centers.x/distance))*(centers.x/distance),(ballSpeed.y*(centers.y/distance))*(centers.y/distance));
      float minDist = confs[j].radius + radius;
      
      if (distance + ballSpeed.x < minDist && distance + ballSpeed.y < minDist) {    // physics of collission
        float angle = atan2(centers.y, centers.x);
        float sine = sin(angle);
        float cosine = cos(angle); 
        
        //float temp1x = cosine * centers.x + sine * centers.y;
        //float temp1y = cosine * centers.y - sine * centers.x;
       
        float ax = cosine * ballSpeed.x + sine * ballSpeed.y;
        float ay = cosine * ballSpeed.y - sine * ballSpeed.x;
        
        b = new PVector(ballSpeed.x-a.x,ballSpeed.y-a.y);
        ballSpeed.x = b.x;                   // change of the movement vector of the calling object
        ballSpeed.y = b.y;
       
        
        ax = cosine * confs[j].ballSpeed.x + sine * confs[j].ballSpeed.y;
        ay = cosine * confs[j].ballSpeed.y - sine * confs[j].ballSpeed.x;
        
        confs[j].ballSpeed.x = a.x;          // change of the movement vector of the other object 
        confs[j].ballSpeed.y = a.y;
      }
    }   
  }
  
}
