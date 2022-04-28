
Tree fir;


void setup() {
  size(800, 500);

  fir = new Tree(400, 20, 6);
  fir.display(fir.root);
  println(fir.traverse(Tree.PRE));
  println(fir.traverse(Tree.POST));
  println(fir.traverse(Tree.IN));

}//setup
