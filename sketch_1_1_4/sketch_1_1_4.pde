String[] words = {"partyboobytrap"};
String sentence = join(words, " ");
String reversed = new String(reverse(sentence.toCharArray()));

void setup() {
  size(200, 200);
  textSize(50);
}

void draw() {
  background(255);
  fill(0);
  println(reversed);
  println(sentence);

  if (sentence.equals(reversed)) {
    text("Yes", width/2, height/2);
  } else {
    text("No", width/2, height/2);
  }
}
