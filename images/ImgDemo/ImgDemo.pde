PImage art;

void setup() {
 size(800, 600);
 art = loadImage("art.jpg");
 art.loadPixels();
}

void draw() {
  image(art, 0, 0);
}

void keyPressed() {
  if (key == 'q') {
    colorQuad();
    art.updatePixels();
  }
  if (key == 'r') {
    art = loadImage("art.jpg");
  }
}

void colorQuad() {
  for (int row=0; row<art.height; row++) {
    for (int col=0; col<art.width; col++) {
      int p = row * art.width + col;
      color c = art.pixels[p];

      if (col < art.width / 2 && row < art.height / 2) {
        art.pixels[p] = color(red(c), green(c), 0);
      }
      else if (col >= art.width/2 && row < art.height / 2) {
        art.pixels[p] = color(red(c), 0, blue(c));
      }
      else if (col < art.width/2 && row >= art.height/2) {
        art.pixels[p] = color(0, green(c), blue(c));
      }
      else {
        art.pixels[p] = c;
      }
    }
  }
}
