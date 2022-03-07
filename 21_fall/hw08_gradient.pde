int radius = 40;

void setup() {
  size(400, 400);
  frameRate(2);
  circleRow(radius);
  //circleGrid(radius);
  saveFrame("output/static.png");
}

void circleRow(int radius) {
  int numCircles = width/(radius * 2);
  float gradient = 255.0 / (numCircles-1);
  int x = radius;
  int y = 200;
  int i = 0;
  float c = 0;

  println("numcirc: " + numCircles);
  println("gradient: " + gradient);

  while (i < numCircles) {
    println("\tcolor: " + c);

    fill(c);
    circle(x, y, radius *2);
    x+= radius*2;
    i+= 1;
    c+= gradient;
  }
}

void circleGrid(int radius) {
  int numCircles = width/(radius * 2);
  int numRows = height/(radius * 2);

  float gradient = 255.0 / (numCircles*numRows-1);
  int x = radius;
  int y = radius;
  int i = 0;
  float c = 0;
  int r = 0;

  println("numcirc: " + numCircles);
  println("numrows: " + numRows);
  println("gradient: " + gradient);
  while (r < numRows ) {
    println("new row");

    while (i < numCircles) {
      println("\tcolor: " + c);

      fill(c);
      circle(x, y, radius *2);
      x+= radius*2;
      i+= 1;
      c+= gradient;
    }
    r+= 1;
    i = 0;
    y+= radius*2;
    x = radius;
  }
}
