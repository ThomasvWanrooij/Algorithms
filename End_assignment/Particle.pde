class Particle {
  PVector pos;
  PVector speed;
  PVector accel;
  int life = 255;

  Particle(PVector initPos) {
    pos = initPos.copy();
    speed = new PVector(random(-3,0),random(-0,3));
    accel = new PVector(0, 0.5);
  }
  void display() {
    speed.add(accel);
    pos.add(speed);
    float size = map(life, 0 , 255, 2, 7);
    noStroke();
    fill(0,51,102, 200);
    ellipse(pos.x,pos.y,size,size);
    
  }

  boolean alive() {
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }
}
