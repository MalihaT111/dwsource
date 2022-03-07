int arr[];
int pos; //current position we are looking at
int testPos; //second position to be tested
int endPos; //last position needed to be tested


void setup() {
  size(400, 400);
  background(0);
  arr = randomArray(10);

  pos = 0;
  testPos = pos + 1;
  endPos = arr.length - 1;
}//setup


void draw() {
  background(0);

  //if endpos is 0, sorted! just display
  if ( endPos == 0 ) {
    displayArray(arr, -1, -1, -1);
  }//sorted
  //else
  else {
    displayArray(arr, pos, testPos, endPos);
    //compare values at pos and testPos
    //if out of order, swap
    if ( arr[pos] > arr[testPos] ) {
      swap(arr, pos, testPos);
    }
    //if not out of order
    else {
      //+1 to pos and testPos
      pos++;
      testPos++;
    }
    //if pos is at endpos
    if (pos == endPos) {
      //reset pos to 0 (and testPos to 1)
      pos = 0;
      testPos = 1;
      //decrease endPos
      endPos--;
    }
  } //unsorted
}//draw


void swap(int[] arr, int i0, int i1) {
  int t = arr[i0];
  arr[i0] = arr[i1];
  arr[i1] = t;
}//swap

int[] randomArray(int num) {
  int[] values = new int[num];

  for (int i=0; i<values.length; i++) {
    values[i] = int(random(100, 400));
  }//random value loop
  return values;
}//randomArray

void displayArray(int[] arr, int p, int tp, int sp) {
  int barWidth = width / arr.length;
  int x = 0;
  int y = 0;
  noStroke();
  for (int i=0; i<arr.length; i++) {
    y = height - arr[i];
    if (i == p ) {
      fill(230, 0, 230);
    }
    else if (i == tp) {
      fill(0, 230, 230);
    }
    else if (i == sp) {
      fill(230, 230, 0);
    }
    else {
      fill(255);
    }
    rect(x, y, barWidth, arr[i]);
    x+= barWidth;
  }
}//displayArray
