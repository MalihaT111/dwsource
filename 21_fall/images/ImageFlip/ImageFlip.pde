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
  if (key == 'h') {
    horizontalFlip();
    art.updatePixels();
  }
  if (key == 'v') {
    verticalFlip();
    art.updatePixels();
  }
  if (key == 'm') {
    mirror();
    art.updatePixels();
  }
  if (key == 'r') {
    art = loadImage("art.jpg");
  }
}

void verticalFlip() {
  PImage tmp = new PImage(art.width, art.height);
  tmp.loadPixels();
  for (int row=0; row < art.height; row++) {
    for (int col=0; col< art.width; col++) {
      int tmppx = (row * art.width) + col;
      int artpx = ((art.height-row-1) * art.width) + col;
      //println(displaypx + " : " + artpx);
      tmp.pixels[tmppx] = art.pixels[artpx];
    }
  }
  art = tmp;
}

void horizontalFlip() {
  PImage tmp = new PImage(art.width, art.height);
  tmp.loadPixels();
  for (int row=0; row < art.height; row++) {
    for (int col=0; col< art.width; col++) {
      int tmppx = (row * art.width) + col;
      int artpx = (row * art.width) + (art.width - col - 1);
      //println(displaypx + " : " + artpx);
      tmp.pixels[tmppx] = art.pixels[artpx];
    }
  }
  art = tmp;
}

void mirror() {
  PImage tmp = new PImage(art.width, art.height);
  for (int row=0; row < art.height; row++) {
    for (int col=0; col< art.width; col++) {
      int tmppx = (row * art.width) + col;
      int artpx = tmppx;
      if (col >= art.width/2) {
        artpx = (row * art.width) + (art.width - col - 1);
      }
      tmp.pixels[tmppx] = art.pixels[artpx];
    }
  }
  art = tmp;
}
