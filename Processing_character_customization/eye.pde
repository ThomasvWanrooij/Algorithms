class Eye {
  PVector eyePosition;
  //array with the names of the images
  String[] eyenames={};
  //array of the eye images.
  PImage[] eye = new PImage[eyenames.length];
  int activecolor=0;
  color eyeColor;
  Eye(PVector initVector) {
    eyePosition=initVector;
  }
  void makingColor() {
         if(activecolor==0){
        eyeColor=color(99,78,52);
      }
       if(activecolor==1){
        eyeColor=color(46,83,111);
      }
         if(activecolor==2){
        eyeColor=color(20,87,224);
      }
       if(activecolor==3){
        eyeColor=color(61,103,29);
      }
       if(activecolor==4){
        eyeColor=color(28,120,71);
      }
       if(activecolor==5){
        eyeColor=color(28,120,71);
      }
       if(activecolor==6){
        eyeColor=color(73,118,101);
      }
         if(activecolor==7){
        eyeColor=color(135,153,165);
      }
  }
  void displayeye() {
       stroke(200);
    strokeWeight(1);
    fill(255);
    ellipse(eyePosition.x-55, eyePosition.y-150, 70, 40); //eyel
    ellipse(eyePosition.x+55, eyePosition.y-150, 70, 40); //eyer
    noStroke();
    fill(eyeColor);
    ellipse(eyePosition.x-55, eyePosition.y-150, 40, 40); //pupill
    ellipse(eyePosition.x+55, eyePosition.y-150, 40, 40); //pupilr 
    fill(0);
    ellipse(eyePosition.x-55, eyePosition.y-150, 10, 10); //irisl
    ellipse(eyePosition.x+55, eyePosition.y-150, 10, 10); //irisr
    stroke(0);
    strokeWeight(5);
  }
  void othereyeplus() {
    if (activecolor<7) {
      activecolor+=1;
    } else {
      activecolor=0;
    }
  }
  void othereyemin() {
    if (activecolor==0) {
      activecolor=7;
    } else {
      activecolor-=1;
      ;
    }
  }
}
