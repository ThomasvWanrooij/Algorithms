//Robin Venhuizen and Thomas van Wanrooij, 2019
//Made by following along with this video by Simon Tiger: https://www.youtube.com/watch?v=Se0Hbp3hy38

ArrayList<FloatDict> circles; // made an array 
int border;

void setup() {
  size(500, 500);
  background(255);

  circles = new ArrayList<FloatDict>(); // creating a new array list

  while (circles.size() < 3000) {

    FloatDict circle = new FloatDict();
    circle.set("x", random(width));
    circle.set("y", random(height));
    circle.set("size", random(3, 30));

    boolean overlapping = false;
    for (int i = 0; i < circles.size(); i++) {
      FloatDict other = circles.get(i);
      float d = dist(circle.get("x"), circle.get("y"), other.get("x"), other.get("y"));

      if (d < circle.get("size") + other.get("size")) {
        overlapping = true;
        break;
      }
    }

    if (!overlapping) { //if the circle doesn't overlap. add a circle
      circles.add(circle);
    }

    border++;

    if (border > 10000) {
      break;
    }
  }

  for (FloatDict c : circles) { //Drawing the circles
    fill(255, 0, 0);
    noStroke();
    ellipse(c.get("x"), c.get("y"), c.get("size")*2, c.get("size")*2);
  }
}
