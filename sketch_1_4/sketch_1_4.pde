float numbers[] = new float[1000];
int sum = 0;

void setup() {
  size(200, 300);
  for (int i = 0; i<numbers.length; i=i+5) {
    numbers[i]= i;
  }

  for (int i = 0; i<numbers.length; i=i+5) {
    if (numbers[i]<=1000) {
     sum += numbers[i];   
    }
  }
}
void draw() {
  println(sum);
}
