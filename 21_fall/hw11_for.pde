int numRows;
int numCols;
int rectWidth;
int rectHeight;
int count;

void settings() {
  numRows = 20;
  numCols = 20;
  rectWidth = 20;
  rectHeight = 20;
  size(numCols * rectWidth, numRows * rectHeight);
}

void setup() {
  frameRate(1);
  count = 0;
}


void draw() {
  fill(255);
  if (count < 5 ) {
    tile();
  } 
  else if (count < 10) {
    alternateRows();
  }
  else if (count < 15) {
    alternateCols();
  }
  else if (count < 20) {
    marksTheSpot();
  }
  else if (count < 25) {
    checkerboard();
  }
  count = (count + 1) % 25;
}

void tile() {
  int x=0;
  int y=0;

  for (int r=0; r < numRows, r++) {
    for (int c=0; c < numCols; c++) {
      rect(x, y, rectWidth, rectHeight);
      x+= rectWidth;
    }
    y+= rectHeight;
    x= 0;
  }
}

void alternateRows() {
  int x=0;
  int y=0;

  for (int r=0; r <= numRows; r++) {
    if (r % 2 == 1) {
      fill(0);
    } else {
      fill(255);
    }
    for (int c=0; c <= numCols; c++) {
      rect(x, y, rectWidth, rectHeight);
      x+= rectWidth;
    }
    y+= rectHeight;
    x= 0;
  }
}

void alternateCols() {
  int x=0;
  int y=0;

  for (int r=0; r < numRows, r++) {
    for (int c=0; c < numCols; c++) {
      if (c % 2 == 1) {
        fill(0);
      } else {
        fill(255);
      }
      rect(x, y, rectWidth, rectHeight);
      x+= rectWidth;
    }
    y+= rectHeight;
    x= 0;
  }
}

/* ===================
  Create a grid of rectangles using the global variables.
  
  fill color should create a checkerboard pattern.
 =================== */
void checkerboard() {
  int x=0;
  int y=0;
  int i = 0;

  for (int r=0; r < numRows, r++) {
    for (int c=0; c < numCols; c++) {
      if (i % 2 == 1) {
        fill(0);
      } else {
        fill(255);
      }
      rect(x, y, rectWidth, rectHeight);
      x+= rectWidth;
      i++;
    }
    y+= rectHeight;
    x= 0;
    i++;
  }
}

void marksTheSpot() {
  int x=0;
  int y=0;

  for (int r=0; r < numRows, r++) {
    for (int c=0; c < numCols; c++) {
      if (c == r || c == (numRows-1) -r) {
        fill(0);
      } else {
        fill(255);
      }
      rect(x, y, rectWidth, rectHeight);
      x+= rectWidth;
    }
    y+= rectHeight;
    x = 0;
  }
}
