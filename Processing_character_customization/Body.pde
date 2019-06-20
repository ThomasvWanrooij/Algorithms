class Body {
  float bodyX;
  float bodyY;
  PImage logo;
  color eyeColor;
  color skin1=#ECEDE3;
  color skin2=#EDD8CE;
  color skin3=#E0CCC3;
  color skin4=#C69F8C;
  color skin5=#AF7E67;
  color skin6=#834D34;
  color shirtcolor;
  color pantscolor;
  int activeshirt;

  color[] skincolors;
  //color skin= color(skin1,skin2,skin3,skin4,skin5,skin6);


  color colorskin;
  //String with the image names
  String[] bodynames={"skin1", "skin2", "skin3", "skin4", "skin5", "skin6"};
  //array of the images
  PImage[] body = new PImage[bodynames.length];
  //Number of the active image
  int activecolor=0;
  Body(float initX, float initY) {
    bodyX=initX;
    bodyY=initY;
   logo=loadImage("Logo.png");
  }

  void makingColor() {
    //making an array of the body images
    //color skin= color(skin1,skin2,skin3,skin4,skin5,skin6);
    if (activecolor==0) {
      colorskin=color(255, 229, 227);
    }
    if (activecolor==1) {
      colorskin=color(255, 206, 180);
    }
    if (activecolor==2) {
      colorskin=color(240, 184, 160);
    }
    if (activecolor==3) {
      colorskin=color(195, 149, 130);
    }
    if (activecolor==4) {
      colorskin=color(165, 126, 110);
    }
    if (activecolor==5) {
      colorskin=color(135, 103, 90);
    }
    if (activecolor==6) {
      colorskin=color(105, 80, 70);
    }
    if (activeshirt==2) {
      shirtcolor=color(0, 0, 255);
      pantscolor=color(0);
     logo=loadImage("superman.png");
    } else {
      shirtcolor=color(0); 
      pantscolor=color(#1C39C4);
      logo=loadImage("Logo.png");
    }
  }
  void oneEye() {
    noStroke();
    fill(colorskin);
    ellipse(bodyX+55, bodyY-150, 100, 50);
    stroke(0);
    strokeWeight(5);
  }
  void displayBody() {
    //arms

    noStroke();
    fill(colorskin);
    ellipse(bodyX-145, bodyY+100, 50, 150); //arml
    ellipse(bodyX+145, bodyY+100, 50, 150); //armr
    ellipse(bodyX-145, bodyY+200, 50, 150); //arml2
    ellipse(bodyX+145, bodyY+200, 50, 150); //armr2

    //head
    ellipse(bodyX, bodyY, 100, 180); //nec
    ellipse(bodyX, bodyY-150, 260, 260); //head
    stroke(0);
    strokeWeight(3);




    //shirt
    stroke(shirtcolor);
    strokeWeight(40);
    line(bodyX-130, bodyY+25, bodyX+130, bodyY+25);

    rect(bodyX-145, bodyY+75, 10, 40);
    rect(bodyX+145, bodyY+75, 10, 40);
    noStroke();
    fill(shirtcolor);
    quad(bodyX-120, bodyY+30, bodyX+120, bodyY+30, bodyX+115, bodyY+250, bodyX-115, bodyY+250);
    arc(bodyX-130, bodyY+45, 80, 80, PI, PI*1.5);
    arc(bodyX+130, bodyY+45, 80, 80, PI*1.5, 2*PI);
    image(logo, bodyX, bodyY+80, 200, 133);
    //pants
    fill(pantscolor);
    ellipse(bodyX-50, bodyY+320, 130, 120); //hipl
    ellipse(bodyX+50, bodyY+320, 130, 120); //hipr
    ellipse(bodyX, bodyY+300, 160, 100); //zak
    ellipse(bodyX-65, bodyY+390, 100, 200); //legl
    ellipse(bodyX+65, bodyY+390, 100, 200); //legr
    ellipse(bodyX-70, bodyY+520, 80, 180); //legl2
    ellipse(bodyX+70, bodyY+520, 80, 180); //legr2
    fill(#F0E5C2);
    fill(shirtcolor);
    rect(bodyX, bodyY+250, 230, 100);


    //feet
    fill(#8E774C);
    noStroke();
    ellipse(bodyX-100, bodyY+600, 125, 60);
    ellipse(bodyX+100, bodyY+600, 125, 60);



    //stroke(200);
    //strokeWeight(1);
    //fill(255);
    //ellipse(bodyX-55, bodyY-150, 70, 40); //eyel
    //ellipse(bodyX+55, bodyY-150, 70, 40); //eyer
    //noStroke();
    //fill(eyeColor);
    //ellipse(bodyX-55, bodyY-150, 40, 40); //pupill
    //ellipse(bodyX+55, bodyY-150, 40, 40); //pupilr 
    //fill(0);
    //ellipse(bodyX-55, bodyY-150, 10, 10); //irisl
    //ellipse(bodyX+55, bodyY-150, 10, 10); //irisr

    stroke(0);
    strokeWeight(5);
  }
  void otherBodyplus() {
    //one body to the right
    if (activecolor<6) {
      activecolor+=1;
    } else {
      activecolor=0;
    }
  }
  void otherBodymin() {
    //one body to the left
    if (activecolor==0) {
      activecolor=6;
    } else {
      activecolor-=1;
      ;
    }
  }
  void superman(int initactiveshirt){
   
      activeshirt=initactiveshirt;
  }
}
