## Brickbreaker Class Dessign.

### Classes:
  1. Ball
  2. Brick
  3. Paddle
  4. Grid

---

### Ball Class
Instance variables:
  - `int cx, cy`: position of the ball.
  - `int xVel, yVel`: speed of the ball.
  - `int radius`: size of the ball.
  - `color c`: fill color for the ball.

Methods:
  - Constructor: `Ball(int x, int y, int xv, int yv, int r, color f)`
    - Sets each instance variable to the corresponding argument.
  - `void display()`
    - Draws a filled in circle using the postision, size and color instance variables.
  - `void move()`
    - Changes the `cx` and `cy` instance variables based on the `xVel` and `yVel` values.
    - Bounces off the top, left, and right edges of the screen.
  
---
