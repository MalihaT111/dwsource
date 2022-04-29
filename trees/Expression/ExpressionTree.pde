class ExpressionTree {

  static final int Y_SPACE = 75;
  static final int PRE = 0;
  static final int POST = 1;
  static final int IN = 2;

  ExpressionTreeNode root;
  int totalLevels;

  ExpressionTree(int x, int y, int numLevels) {
    totalLevels = numLevels;
    root = makeTree(x, y, numLevels);
    populateTree(root);
  }//constructor

  ExpressionTreeNode makeTree(int x, int y, int numLevels) {
    if (numLevels == 0) {
      return null;
    }

    ExpressionTreeNode newNode = new ExpressionTreeNode(x, y, 0, 0);

    float xoffset = width / (pow(2, totalLevels - numLevels+2));
    int leftX = int(x + xoffset * -1);
    int rightX = int(x + xoffset);
    int newY = y + Y_SPACE;

    newNode.left = makeTree(leftX, newY, numLevels-1);
    newNode.right = makeTree(rightX, newY, numLevels-1);

    return newNode;
  }//makeTree

  void populateTree(ExpressionTreeNode current) {

  }//populateTree



  void display(ExpressionTreeNode current) {
    if (current != null) {
      current.display();
      display(current.left);
      display(current.right);
    }
  }//display

  String traverse(int type) {
    if (type == PRE)
      return preOrder(root);
    else if (type == POST)
      return postOrder(root);
    else if (type == IN)
      return inOrder(root);
    return "";
  }

  String preOrder(TreeNode current) {
    if (current != null) {
      return current.data+ " " + preOrder(current.left) + preOrder(current.right);
    }
    return "";
  }

  String postOrder(TreeNode current) {
    if (current != null) {
      return postOrder(current.left) + postOrder(current.right) + current.data + " ";
    }
    return "";
  }

  String inOrder(TreeNode current) {
    if (current != null) {
      return inOrder(current.left) + current.data + " " +  inOrder(current.right);
    }
    return "";
  }
}//OrbTree
