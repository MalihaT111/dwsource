float cx;
float cy;
float theta;
int g;

void setup() {
  size(400, 400);
  theta = 0;
  cx = 0;
  g = 0;
}

void draw() {
  background(255);
  fill(0, g, 0);
  cy = newY(100, height/2, theta);
  cx = newX(100, width/2, theta);
  circle(cx, cy, 50);
  line(width/2, height/2, cx, cy);
  theta++;
  
  if (theta % 30 == 0) {
    g+= 10;    
  }
  if (g > 255) {
    g = 0;
  }
}

float newY(int r, int c, float theta) {
  float y = sin(radians(theta));
  return r * y + c;
}

float newX(int r, int c, float theta) {
  float x = cos(radians(theta));
  return r * x + c;
}
