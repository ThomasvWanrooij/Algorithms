class Mouth {
  PVector mouthPosition;
  // Array with the names of the images
  String[] mouthnames={"mouth1.png","mouth2.png","mouth3.png","mouth4.png","mouth5.png","mouth6.png","mouth7.png"};
  //array with the mouth images
  PImage[] mouth = new PImage[mouthnames.length];
  int activemouth=0;
  Mouth(PVector initVector) {
    mouthPosition=initVector;
  }
  void makingMouth() {
    //making an array with images.
    for (int i=0; i<mouthnames.length; i++) {
      String mouthname=mouthnames[i];
      mouth[i]=loadImage(mouthname);
    }
  }
  void displaymouth() {
    //displaying the image that is active
    image(mouth[activemouth], mouthPosition.x, mouthPosition.y);
  }
  void othermouthplus() {
    if (activemouth<mouthnames.length-1) {
      activemouth+=1;
    } else {
      activemouth=0;
    }
  }
  void othermouthmin() {
    if (activemouth==0) {
      activemouth=mouthnames.length-1;
    } else {
      activemouth-=1;
      ;
    }
  }
}
