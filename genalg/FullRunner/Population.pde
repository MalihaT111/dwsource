class Population {

  final static float DEFAULT_MUTATION_RATE = 0.05;

  Individual pop[];
  Individual omitted;
  int numIndividuals;
  float totalFitness;
  float mutationRate;

  Population(int popSize) {
    numIndividuals = popSize;
    pop = new Individual[numIndividuals];
    omitted = null;
    mutationRate = DEFAULT_MUTATION_RATE;
  }//constructor

  void randomPop() {
    for (int p=0; p < numIndividuals; p++) {
      pop[p] = new Individual(true);
    }
    omitted = null;
  }//randomPop


  void drawPopGrid(int cols, int rows, int maxSize, int offset, boolean showFitness) {
    for (int p=0; p < numIndividuals; p++) {
      int x = (p % cols) * (maxSize + offset) + (maxSize + offset) / 2;
      int y = (p / cols) * (maxSize + offset) + (maxSize + offset) / 2;
      pop[p].display(x, y, showFitness);
    }
  }//drawPopGrid

  Individual get(int index) {
    return pop[index];
  }//get

  void setOmitted(int o) {
    omitted = pop[o];
  }//setOmitted

  void setFitness(Individual target) {
    totalFitness = 0;
    omitted.fitness = 1;
    for (int p=0; p < numIndividuals; p++) {
      if (pop[p] != omitted) {
        pop[p].setFitness(target);
        totalFitness+= pop[p].fitness;
      }
    }
  }//setFitness

  Individual select() {
    float r = random(totalFitness);
    float fitnessCounter = 0;
    int p = -1;
    while (fitnessCounter < r) {
      p++;
      if ( omitted == null || pop[p] != omitted ) {
        fitnessCounter+= pop[p].fitness;
      }
    }
    return pop[p];
  }//select

  Population matingSeason(boolean keepBest) {
    Population nextGeneration = new Population( numIndividuals );
    int bestIndex = -1;
    if (keepBest) {
      bestIndex = getBestIndex();
    }
    for (int p=0; p < numIndividuals; p++) {
      if (pop[p] == omitted) {
        nextGeneration.pop[p] = pop[p];
      }
      else if (keepBest && (p == bestIndex)) {
        nextGeneration.pop[p] = pop[p];
      }
      else {
        Individual p0 = select();
        Individual p1 = select();
        Individual child = p0.mate(p1);
        child.mutate(mutationRate);
        nextGeneration.pop[p] = child;
      }
     //  //print(nextGeneration.pop[p]);
    }
    nextGeneration.omitted = omitted;
    return nextGeneration;
  }//matingSeason

  int getBestIndex() {
    int best = 1;
    for (int p=0; p < numIndividuals; p++) {
      if (pop[p] != omitted) {
        if (pop[p].fitness > pop[best].fitness) {
          best = p;
        }
      }
    }
    return best;
  }//getBest

  float getBestFitness() {
    return pop[getBestIndex()].fitness;
  }//getBestFitness

  float getAvgFitness() {
    if (omitted == null)
      return totalFitness / numIndividuals;
    else
      return totalFitness / (numIndividuals-1);
  }

}//Population
