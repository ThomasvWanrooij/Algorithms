int first;
int second;
int third;

void setup() {
  size(500, 500);
  textSize(30);
}


void draw() {
  background(255);
  fill(255, 0, 0);


  for (int i = 0; i <= 1; i++) {
    first = i;
    for (int j = 0; j <= 1; j++) {
      second = j;
      for (int k = 0; k <= 1; k++) {
        third = k;
        println(first, second, third);
      }
    }
  }
}
