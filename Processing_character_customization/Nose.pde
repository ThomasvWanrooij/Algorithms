class Nose {
  PVector nosePosition;
  // Array with the names of the images
  String[] nosenames={"nose.png","varkensneus.png","nose1.png","pignose.png"};
  //array with the mouth images
  PImage[] nose = new PImage[nosenames.length];
  int activenose=0;
  Nose(PVector initVector) {
    nosePosition=initVector;
  }
  void makingNose() {
    //making an array with images.
    for (int i=0; i<nosenames.length; i++) {
      String nosename=nosenames[i];
      nose[i]=loadImage(nosename);
    }
  }
  void displaynose(int activenose) {
    //displaying the image that is active
    image(nose[activenose], nosePosition.x, nosePosition.y,40,40);
  }

}
