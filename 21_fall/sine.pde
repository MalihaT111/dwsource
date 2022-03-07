float cx;
float cy;
float theta;

void  setup() {
  size(400, 400);
  background(255); 
  cx = 0;
  cy = 0;
  theta = 0;
}  

void draw() {
  //background(255);

  cy = calcY(100, height/2, theta);
  circle(cx, cy, 50);
  cx++;
  theta++;
  
  println("deg: " + theta + "\trad: " + radians(theta));
  if ( cx >= width ) {
    cx = 0;
  }
}

float calcY(int amplitude, int offset, float t) {
  float y;
  y = sin(radians(t));
  y = amplitude * y + offset;
  return y;
}
