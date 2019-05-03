String[] words={"REEEEEEE.", "Word!", "Yeet?"};
String sentence = join(words, " ");
char check = 'e';
char check2 = 'E';
int count;

void setup() {
    for (int i =0; i<sentence.length(); i++) {
    if (sentence.charAt(i)==check||sentence.charAt(i)==check2) {
      count++;
    }
  }
}

void draw() {

  println(count);
}
