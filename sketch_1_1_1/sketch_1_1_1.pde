String[] words = {"Kippetje.", "Word!", "YEET?"};
String sentence = join(words, " ");

void setup() {
  size(800, 800);
  textSize(50);
  background(255);
}

void draw() {
  
  fill(0);
  for(int i =0; i<sentence.length();i++){
    text (sentence.charAt(i), 35*i, height/2);
  }
}
