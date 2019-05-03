String[] words = {"Kippetje.", "Word!", "YEET?"};
String sentence = join(words, " ");
String reversed = new String(reverse(sentence.toCharArray()));
char check = 'e';
char check2 = 'E';
int count;
boolean isPal;

void setup() {
  size(800, 800);
  textSize(50);
  counter();
}

void draw() {
  background(255);
  fill(0);
  ordinary();
  reversed();
  text("Amount of E's:"+count, 50, height-100);
  println(palindrome());
}

void ordinary() {
  for (int i =0; i<sentence.length(); i++) {
    text (sentence.charAt(i), 35*i, height/2-50);
  }
}

void reversed() {
  for (int i = 0; i<sentence.length(); i++) {
    text (reversed.charAt(i), 20+35*i, height/2+50);
  }
}

int counter() {
  for (int i =0; i<sentence.length(); i++) {
    if (sentence.charAt(i)==check||sentence.charAt(i)==check2) {
      count++;
    }
  }
  return count;
}

boolean palindrome() {
  if (sentence.equals(reversed)) {
    isPal = true;
  } else {
    isPal = false;
  }
  return isPal;
}
