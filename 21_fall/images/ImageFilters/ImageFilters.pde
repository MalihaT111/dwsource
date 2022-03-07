color tone = color(183, 139, 85);

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
  if (key == 's') {
    art = colorFilter(art, tone);
    art.updatePixels();
  }
  if (key == 'g') {
    art = grayScale(art);
    art.updatePixels();
  }
  if (key == 'r') {
    art = loadImage("art.jpg");
  }
}

PImage grayScale(PImage img) {
  PImage tmp = new PImage(art.width, art.height);
  tmp.loadPixels();
  float gray = 0;
  for (int row=0; row < art.height; row++) {
    for (int col=0; col< art.width; col++) {
      int px = (row * art.width) + col;
      color pc = art.pixels[px];
      gray = (red(pc) + green(pc) + blue(pc))/3;
      //tmp.pixels[px] = color(gray, gray, gray);
      tmp.pixels[px] = color(gray);
    }
  }
  return tmp;
}

PImage colorFilter(PImage img, color c) {
  PImage tmp = new PImage(art.width, art.height);
  tmp.loadPixels();
  float gray = 0;
  for (int row=0; row < art.height; row++) {
    for (int col=0; col< art.width; col++) {
      int px = (row * art.width) + col;
      color pc = art.pixels[px];
      gray = (red(pc) + green(pc) + blue(pc))/3;
      gray = gray/255;
      float newRed = gray * red(c);
      float newGreen = gray * green(c);
      float newBlue = gray * blue(c);
      tmp.pixels[px] = color(newRed, newGreen, newBlue);
    }
  }
  return tmp;
}
