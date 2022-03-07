Ball b0;
Ball b1;

void setup() {
  size(600, 400);
  b0 = new Ball(); //calling the constructor
  b1 = new Ball(#FF00FF); //calling the constructor
}

void draw() {
  background(0);
  b0.display();
  b1.display();
  b0.move();
  b1.move();    
}
