String[] binary = {"1", "0", "0", "1", "0", "1"};
String binaryWhole = join(binary, " ");
int decimal;

void setup() {
  size(500, 500);
  textSize(50);
  textAlign(CENTER);
}

void draw() {
  background(0);
  text(binaryWhole, width/2, 100);
  text("=", width/2, height/2);
  //((((a*2+b)*2+c)*2+d)*2+e)*2+f
  decimal = (((((int(binary[0])*2)+int(binary[1]))*2+int(binary[2]))*2+int(binary[3]))*2+int(binary[4]))*2+int(binary[5]);
  text(decimal, width/2, height-100);
}
