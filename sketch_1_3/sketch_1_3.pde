float numbers[] = new float[500];
int counter = 0;

void setup() {
  size(1280, 720);
  for (int i = 0; i<numbers.length; i++) {
    numbers[i]=random(100);
  }

  for (int i = 0; i<numbers.length; i++) {
    if (numbers[i]>=50) {
      counter++;
    }
  }
}
void draw() {
  println(counter);
}
