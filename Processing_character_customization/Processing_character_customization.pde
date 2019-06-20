//defining new objects
Hair haircuts;
Mouth mouths;
Eye eyes;
Body skincolors;
Effect effects;
Nose noseA;

//effects booleans
boolean blub=false;
boolean rip=false;
boolean zombie=false;
boolean oneEye=false;
boolean disappear=false;
boolean superman=false;
boolean effectmenu;
boolean nose=false;

//connecting stuff
import processing.serial.*;
Serial myPort;  // Create object from Serial class
String data;     // Data received from the serial port

void setup() {
  //object modes
  imageMode(CENTER);
  rectMode(CENTER);
  //screensize
  fullScreen();
  //declaring the body parts.
  haircuts= new Hair(new PVector(width/2-5, height/2-200)); 
  mouths= new Mouth(new PVector(width/2-10, height/2-185));
  skincolors=new Body(width/2, height/2-100);
  eyes=new Eye(new PVector(width/2, height/2-100));
  noseA = new Nose(new PVector(width/2, height/2-230));

  effects=new Effect(new PVector(width/2, height/2));
  //making arrays with the body parts.
  haircuts.makingHair();
  mouths.makingMouth();
  effects.makingEffect();
  noseA.makingNose();

  //connecting stuff
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
}
void draw() {
  background(#BCC2C6);
  fill(255);

  //Background lines
  strokeWeight(5);
  line(0, height/4, width, height/4);
  line(0, height/2, width, height/2);
  line(0, height/4*3, width, height/4*3);

  //buttons left
  triangle(250, height/8, 400, height/16, 400, height/16*3);
  triangle(250, height/8*3, 400, height/16*5, 400, height/16*7);
  triangle(250, height/8*5, 400, height/16*9, 400, height/16*11);
  triangle(250, height/8*7, 400, height/16*13, 400, height/16*15);
  //buttons right
  triangle(width-250, height/8, width- 400, height/16, width-400, height/16*3);
  triangle(width-250, height/8*3, width- 400, height/16*5, width-400, height/16*7);
  triangle(width-250, height/8*5, width-400, height/16*9, width-400, height/16*11);
  triangle(width-250, height/8*7, width-400, height/16*13, width-400, height/16*15);
  //text
  textSize(60);
  text("Hair", 100, height/8+10);
  text("Eyes", 100, height/8*3+10);
  text("Mouth", 60, height/8*5+10);
  text("Skin", 100, height/8*7+10);
  //middle white area.
  rect(width/2, height/2, width/2, height+20);
  //displayinh body parts
  skincolors.displayBody();
  skincolors.makingColor();
  eyes.displayeye();
  eyes.makingColor();
  mouths.displaymouth();
  haircuts.displayhair();

  //hidden effects
  if (effectmenu) {
    fill(255);
    rect(width-120, height/2, 240, height+20);
    fill(0);
    textAlign(LEFT);
    textSize(25);
    text("Blub=b", width-200, 50);
    text("rip=r", width-200, 100);
    text("zombie=z", width-200, 150);
    text("oneeye=e", width-200, 200);
    text("disappear=d", width-200, 250);
    text("superman=s", width-200, 300);
    text("nose=n", width-200, 350);
  }
  if (oneEye) {
    skincolors.oneEye();
  }
  if (nose) {
    noseA.displaynose(3);
  } else {
    noseA.displaynose(0);
  }
  if (blub) {
    effects.displayeffect(0);
  }
  if (rip) {
    effects.displayeffect(1);
  }
  if (zombie) {
    effects.displayeffect(2);
  }

  if (disappear) {
    effects.disappear();
  }
  if (superman) {
    skincolors.superman(2);
  } else {
    skincolors.superman(1);
  }

  data();
}
void mousePressed() {
  //hair buttons
  if (mouseX>250 && mouseX<400 && mouseY<height/16*3 && mouseY>height/16) {
    haircuts.otherhairmin();
  }
  if (mouseX<width-250 && mouseX>width-400 && mouseY<height/16*3 && mouseY>height/16) {
    haircuts.otherhairplus();
  }
  //eye buttons
  if (mouseX>250 && mouseX<400 && mouseY<height/16*7 && mouseY>height/16*5) {
    eyes.othereyemin();
  }
  if (mouseX<width-250 && mouseX>width-400 && mouseY<height/16*7 && mouseY>height/16*5) {
    eyes.othereyeplus();
  }
  //mouth buttons

  if (mouseX>250 && mouseX<400 && mouseY<height/16*11 && mouseY>height/16*9) {
    mouths.othermouthmin();
  }
  if (mouseX<width-250 && mouseX>width-400 && mouseY<height/16*11 && mouseY>height/16*9) {
    mouths.othermouthplus();
  }
  //Skin color buttons
  if (mouseX>250 && mouseX<400 && mouseY<height/16*15 && mouseY>height/16*13) {
    skincolors.otherBodymin();
  }
  if (mouseX<width-250 && mouseX>width-400 && mouseY<height/16*15 && mouseY>height/16*13) {
    skincolors.otherBodyplus();
  }
}
void keyPressed() {
  if (key == 'b') {
    blub=!blub;
    effectmenu=false;
  }
  if (key =='r') {
    rip=!rip;
    effectmenu=false;
  }
  if (key=='z') {
    zombie=!zombie;
    effectmenu=false;
  }
  if (key =='e') {
    oneEye=!oneEye;
    effectmenu=false;
  }
  if (key=='d') {
    disappear=!disappear;
    effectmenu=false;
  }
  if (key=='s') {
    superman=!superman;
    effectmenu=false;
  }
  if (key =='m') {
    effectmenu=!effectmenu;
  }
  if (key =='n') {
    nose=!nose;
    effectmenu=false;
  }
}

void data() {
  //connecting stuff
  if ( myPort.available() > 0) {  // If data is available,
    data = myPort.readStringUntil('\n');         // read it and store it in val
    
  }

  //println(data);


  if (data.equals("401") || data.equals("402") || data.equals("403")) {
    fill(255, 0, 0);
    textSize(50);
    text("WRONG COLOUR CONNECTED", 600, 70);
  }
}
