int POP_COLS = 6;
int POP_ROWS = 5;
int OFFSET = 1;
int POP_SIZE = POP_COLS * POP_ROWS;
int MAX_SIZE = int(pow(2, Individual.SIZE_GENE_LENGTH+1) - 1);

Population pop;
Individual target;
int generationCount;

void settings() {
  size(POP_COLS*MAX_SIZE + (POP_COLS-1)*OFFSET,
       POP_ROWS*MAX_SIZE + (POP_ROWS-1)*OFFSET);
}//settings
void setup() {
  pop = new Population(POP_SIZE);
  makePopulation();
}//setup

void draw() {
  background(255);
  pop.drawPopGrid(POP_COLS, POP_ROWS, MAX_SIZE, OFFSET, true);
  drawGrid();
  int bestI = pop.getBestIndex();
  highlightIndividual( (bestI % POP_COLS) * (MAX_SIZE + OFFSET), (bestI / POP_COLS) * (MAX_SIZE + OFFSET), color(0, 255, 255));
}//draw

void keyPressed() {
  if (key == 'p') {
    makePopulation();
  }
  if (key == 'm') {
    generationCount++;
    pop = pop.matingSeason(true);
    pop.setFitness(target);
    println("Generation " + generationCount);
    println("Best fitness: " + pop.getBestFitness());
    println("Avg  fitness: " + pop.getAvgFitness());
  }
}//keyPressed

void makePopulation() {
  pop.randomPop();
  pop.setOmitted(0);
  target = pop.get(0);
  pop.setFitness(target);
  generationCount = 0;
}//makePopulation()

void highlightIndividual(int x, int y, color c) {
  noFill();
  strokeWeight(5);
  stroke(c);
  rect(x, y, MAX_SIZE, MAX_SIZE);
  strokeWeight(1);
}

void drawGrid() {
  stroke(0);
  for (int i=1; i < POP_COLS; i++) {
    int x = i * (MAX_SIZE + OFFSET);
    line(x, 0, x, height-1);
  }//row dividers

  for (int i=1; i < POP_ROWS; i++) {
    int y = i * (MAX_SIZE + OFFSET);
    line(0, y, width-1, y);
  }//column dividers
}//drawGrid
