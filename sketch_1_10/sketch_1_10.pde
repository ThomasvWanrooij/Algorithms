// pink confetti 6
// series of examples for Programming in module 1
// pinkish confettis with class, array, collission and creation on mouseclick
// angelika mader, september 2015


int maxconfetti = 30;
Confetti[] confs=new Confetti[maxconfetti]; //this makes an array of 30 confettis
int i=0;      // number of confettis that is created already

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  for (int k=0; k<i; k++)         // i contains the number of confettis created so far
  { 
    confs[k].move_confetti();
    confs[k].collide();
    confs[k].draw_confetti();
  }
}

void mousePressed() {        
  if (i<maxconfetti)
  { 
    confs[i] = new Confetti(i);   // a new confetti is only created here!
    i++;
  };
}
