class OrbNode {

  static final float DAMPING = 0.995;

  static final float SPRING_CONST = 0.005;
  static final float SPRING_LEN = 50;

  PVector position;
  PVector velocity;
  PVector acceleration;
  float osize;

  OrbNode next;
  OrbNode previous;

  OrbNode(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    osize = 15;
    next = null;
    previous = null;
  }//constructor

  void display() {
    stroke(0);
    fill(240, 140, 40);
    circle(position.x, position.y, osize);
    if (next != null ) {
      stroke(40, 200, 190);
      line(position.x+1, position.y+1, next.position.x+1, next.position.y+1);
    }
    if (previous != null) {
      stroke(210, 50, 150);
      line(position.x-1, position.y-1, previous.position.x-1, previous.position.y-1);
    }
  }//display

  void run() {
    velocity.add(acceleration);
    if ( checkYBounds()) {
      velocity.y *= -1;
    }
    if ( checkXBounds() ) {
      velocity.x*= -1;
    }
    //velocity.mult(DAMPING);
    position.add(velocity);
    acceleration.mult(0);
  }//run

  boolean checkYBounds() {
    boolean check = position.y <= osize/2;
    check = check || position.y >= height - osize/2;
    return check;
  }
  boolean checkXBounds() {
    boolean check = position.x <= osize/2;
    check = check || position.x >= width - osize/2;
    return check;
  }
  void applyForce(PVector f) {
    acceleration.add(f);
  }//applyForce

  void applySpringForce() {
    if ( next != null ) {
      applyForce( calculateSpring(next) );
    }
    if (previous != null) {
      applyForce( calculateSpring(previous) );
    }
  }//applySpringForce


  PVector calculateSpring(OrbNode other) {
    float dist = position.dist(other.position);
    float displacement = dist - SPRING_LEN;
    float springForce = displacement * SPRING_CONST;

    float xDiff = other.position.x - position.x;
    float yDiff = other.position.y - position.y;
    float xForce = springForce * xDiff/dist;
    float yForce = springForce * yDiff/dist;

    return new PVector(xForce, yForce);
  }

}//orb
