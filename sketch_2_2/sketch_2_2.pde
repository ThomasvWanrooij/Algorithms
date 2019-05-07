//By Robin Venhuizen (2114186) and Thomas van Wanrooij (2153270), 2019

int[] numbers = {1, 2, 3, 4, 5, 6};
int [] counters = new int[6];
int number = 1;
int random;

void setup() {
  size(500, 500);
  textSize(30);
}

void draw() {
  background(0);
  fill(255);
  text(number, width/2, height/2);
  for (int i = 1; i < numbers.length+1; i++) {
    text(i + ": " + counters[i-1], 30, 50+30*i);
  }
}

void counter() {
  for (int i = 1; i < numbers.length+1; i++) {
    if (i == number) {
      counters[i-1]++;
    }
  }
}

void roll() {
  random = int(random(numbers[0], numbers[5]+2));
  if (random >= 6) {
    number = 6;
  } else number = random;

  counter();
}

void mouseClicked() { // roll the dice once
  roll();
}

void keyPressed() { //roll the dice a million times
  if (key == 'm' || key == 'M') {
    for (int i = 0; i < 1000000; i++) {
      roll();
    }
  }
}
