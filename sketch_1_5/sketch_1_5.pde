int sum = 0;
int limit = 1000;

void setup() {
  for (int i = 0; i<limit; i++) {
    if (i % 3 == 0 || i % 5 == 0) {
      sum = i + sum;
    }
  }

  println(sum);
}
