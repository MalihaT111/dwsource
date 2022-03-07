
void setup() {
  size(400, 400);
  background(255);
  
  int x = 50;
  int y = 200;
//  while (y <= 350) {
   // x = 50;
    while (x <= 350 ) {
      cookie(x, y);
      x+= 100;
    }
   // y+= 100;
  //}
}

void cookie(int x, int y) {
  
  //head
  fill(0, 0, 255);
  //ellipse(x, y, 100, 75); refernce ellipse
  arc(x, y, 100, 75, -0.5, PI+0.5, OPEN);
  //ellipse(x, y-12, 90, 40); 
  arc(x, y-12, 90, 40, PI+0.25, TWO_PI-0.25);
  
  //mouth
  fill(0);
  //ellipse(x, y, 80, 55);
  arc(x, y, 80, 55, -0.5, PI+0.5, OPEN);
  
  //eyes
  fill(255);
  circle(x-13, y-30, 26);
  circle(x+13, y-30, 26);
  //irises
  fill(0);
  circle(x-8, y-28, 10);
  circle(x+8, y-32, 10);
}
