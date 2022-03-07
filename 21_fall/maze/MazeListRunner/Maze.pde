class Maze {


    int rows;
    int cols;
    int grid[][];

    Maze(String file) {
      String[] lines = loadStrings(file);
      rows = lines.length;
      cols = lines[0].length();

      grid = new int[rows][cols];
      for (int r=0; r < grid.length; r++) {
        for (int c=0; c < grid[r].length; c++) {
          int spot = SPACE;
          if (lines[r].charAt(c) == '#') {
            spot = WALL;
          }//wall
          else if (lines[r].charAt(c) == '?') {
            spot = START;
          }//start
          else if (lines[r].charAt(c) == '$') {
            spot = FINISH;
          }
          grid[r][c] = spot;
        }//cols
      } //rows
    }//constructor

    void display() {
      int cellWidth = width / cols;
      int cellHeight = height / rows;

      for (int r=0; r < grid.length; r++) {
        for (int c=0; c < grid[r].length; c++) {
          if (grid[r][c] == WALL) {
            fill(0);
          }//wall fill
          else if (grid[r][c] == SPACE) {
            fill(255);
          }//space fill
          else if (grid[r][c] == START ) {
            fill(0, 255, 0);
          }//start fill
          else if (grid[r][c] == FINISH) {
            fill(255, 0, 0);
          }//end fill
          else if (grid[r][c] == PATH) {
            fill(0, 0, 255);
          }
          rect(c*cellWidth, r*cellHeight, cellWidth, cellHeight);
        }//cols
      }//rows
    }//display
}
