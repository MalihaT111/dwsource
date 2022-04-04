Orb pn0;
float GRAVITY = 0.1;
PVector g;

boolean moving;

void setup() {
  size(800, 400);
  g = new PVector(0, GRAVITY);
  reset();
}//setup

void draw() {
  background(255);
  if (moving) {
    pn0.applyForce(g);
    pn0.run();
  }
  pn0.display();
}//draw

void reset() {
  moving = false;
  pn0 = new Orb(10, 390);
}//reset

void keyPressed() {
  if (key == ' ') {
    moving = !moving;
  }
  if (key == 'h') {
    pn0.applyForce(new PVector(6, -6));
    moving = true;
  }
  if (key == 'r') {
    reset();
  }
}//keyPressed
