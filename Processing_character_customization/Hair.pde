class Hair {
  PVector hairPosition;
  //array with the image names.
  String[] haircutnames={"haircut1red.png", "haircut1brown.png", "haircut1blond.png", "haircut2red.png", "haircut2brown.png", "haircut2blond.png", "haircut3red.png", "haircut3brown.png", "haircut3blond.png", "haircut4red.png", "haircut4brown.png", "haircut4blond.png", "haircut5red.png", "haircut5brown.png", "haircut5blond.png", "haircut6red.png", "haircut6brown.png", "haircut6blond.png", "haircut7red.png", "haircut7brown.png", "haircut7blond.png", "haircut8red.png", "haircut8brown.png", "haircut8blond.png", "haircut9red.png", "haircut9brown.png", "haircut9blond.png"};
  //array of images
  PImage[] haircuts = new PImage[haircutnames.length];
  //the number of the active image.
  int activehair=0;
  Hair(PVector initVector) {
    hairPosition=initVector;
  }
  void makingHair() {
    //making the array with the images
    for (int i=0; i<haircutnames.length; i++) {
      String haircutname=haircutnames[i];
      haircuts[i]=loadImage(haircutname);
  
    }
  }
  void displayhair() {
    //displaying the image which is active.
    image(haircuts[activehair], hairPosition.x, hairPosition.y);

  }
  void otherhairplus() {
    if (activehair<haircutnames.length-1) {
      activehair+=1;
    } else {
      activehair=0;
    }
  }
  void otherhairmin() {
    if (activehair==0) {
      activehair=haircutnames.length-1;
    } else {
      activehair-=1;
      ;
    }
  }
}
