int SPACE = 0;
int WALL = 1;
int START = 2;
int FINISH = 3;
int PATH = 4;

Maze m;

void setup() {
  size(400, 400);
  m = new Maze("maze_simple.txt");
  m.display();

  Move a = new Move(1, 1, START);
  println(a);

  MoveList moves = new MoveList();
  moves.add(a);
  moves.add(new Move(1, 2, PATH));
  moves.add(new Move(1, 3, PATH));
  println(moves);
}
