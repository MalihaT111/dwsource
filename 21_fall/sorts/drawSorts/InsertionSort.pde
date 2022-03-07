int arr[];
int pos; //current position to test
int sortEnd; //end of the sorted portion
int insertVal; //value to be added

void setup() {
  size(400, 400);
  background(0);
  arr = randomArray(10);

  sortEnd = 0;
  pos = sortEnd + 1;
  insertVal = arr[pos];
}//setup


void draw() {
  background(0);

  //if sorted, just display. sortEnd is arr.length -1
  if ( sortEnd == arr.length - 1) {
    displayArray(arr, -1, -1, -1);
  }
  //else
  else {
  displayArray(arr, pos, sortEnd, insertVal);
    //compare insertVal and arr[pos -1]
    //if pos is not 0 AND inserVal <
    if (pos != 0 && insertVal < arr[pos-1] ) {
      //move value at [pos-1] to [pos]
      arr[pos] = arr[pos-1];
      //decrease pos
      pos--;
    }
    //else
    else {
      //set arr[pos] to insertVal
      arr[pos] = insertVal;
      //reset sortEnd, pos, insertVal
      sortEnd++;
      pos = sortEnd + 1;
      if (pos < arr.length) {
        insertVal = arr[pos];
      }
    }
  }//unsorted
}//draw


int[] randomArray(int num) {
  int[] values = new int[num];

  for (int i=0; i<values.length; i++) {
    values[i] = int(random(100, 400));
  }//random value loop
  return values;
}//randomArray

void displayArray(int[] arr, int p, int se, int iv) {
  int barWidth = width / arr.length;
  int x = 0;
  int y = 0;
  noStroke();
  for (int i=0; i<arr.length; i++) {
    y = height - arr[i];
    if (i == p ) {
      fill(0, 230, 230);
    }
    else if (i == se) {
      fill(230, 0, 230);
    }
    else {
      fill(255);
    }
    rect(x, y, barWidth, arr[i]);
    if (i == p) {
      fill(230, 230, 0);
      rect(x, height-iv, barWidth, iv);
    }
    x+= barWidth;
  }
}//displayArray
