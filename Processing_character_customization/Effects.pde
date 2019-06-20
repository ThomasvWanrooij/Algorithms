class Effect {
  PVector effectPosition;
  //array with the image names.
  String[] effectnames={"Blub.png", "rip.png", "zombie.png"};
  //array of images
  PImage[] effect = new PImage[effectnames.length];
  //the number of the active image.
  int activeeffect=0;
  Effect(PVector initVector) {
    effectPosition=initVector;
  }
  void makingEffect() {
    //making the array with the images
    for (int i=0; i<effectnames.length; i++) {
      String effectname=effectnames[i];
      effect[i]=loadImage(effectname);
    }
  }
  void displayeffect(int initEffect) {
    //displaying the image which is active.
    fill(255);
    rect(width/2, height/2, width/2, height+20);
    image(effect[initEffect], effectPosition.x, effectPosition.y);
  }
  void disappear() {
    fill(255);
    rect(width/2, height/2, width/2, height+20);
  }
  void othereffectplus() {
    if (activeeffect<effectnames.length-1) {
      activeeffect+=1;
    } else {
      activeeffect=0;
    }
  }
  void othereffectmin() {
    if (activeeffect==0) {
      activeeffect=effectnames.length-1;
    } else {
      activeeffect-=1;
      ;
    }
  }
}
