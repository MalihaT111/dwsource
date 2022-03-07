int x;
int y;
int xVel;
int yVel;
int rectW;
int rectH;

boolean logo;
PImage dvd;

void setup() {
  size(600, 400);
  rectW = 100;
  rectH = 50;
  x = int(random(width - rectW));
  y = int(random(height - rectH));
  xVel = int(random(-5, 5));
  if (xVel == 0) { xVel = 5; }
  yVel = int(random(-5, 5));
  if (yVel == 0) { yVel = 5; }
  fill(255);

  dvd = loadImage("dvd.jpg");
  logo = false;
}

void draw() {
  background(0);

  if (x <= 0 ||
      x >= (width-rectW)) {
    xVel *= -1;
  }
  if ( y <= 0 ||
       y >= (height-rectH)) {
    yVel *= -1;
  }
  
  if (logo) {
    image(dvd, x, y, rectW, rectH);
  }
  else {
    rect(x, y, rectW, rectH);
  }
  
  x+= xVel;
  y+= yVel;
}

void keyPressed() {
  logo = !logo;
}
