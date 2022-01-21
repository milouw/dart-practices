class Tree<T> {
  T? value;
  List<Tree> children = [];
  Tree(this.value, this.children);

  Tree.fromList(List list) {
    if (list.length > 0) value = list.first;
    if (list.length > 1)
      for (var t in list.sublist(1)) children.add(Tree.fromList(t));
  }

  void inverse() {
    if (children.isNotEmpty) {
      children = children.reversed.toList();
      for (var child in children) child.inverse();
    }
  }

  void dfs(Function(dynamic val) f) {
    f(value);
    for (var t in children) t.dfs(f);
  }

  void bfs(Function(dynamic val) f) {
    List<Tree> queue = [this];
    for (var i = 0; i < queue.length; i++) {
      f(queue[i].value);
      for (var child in queue[i].children) {
        if (!queue.contains(child)) queue.add(child);
      }
    }
  }

  List toList() {
    return [value, for (var t in children) t.toList()];
  }

  @override
  String toString() {
    return this.toList().toString();
  }
}

main() {
  var treeList = [
    1,
    [
      2,
      [
        7,
        [8]
      ]
    ],
    [
      3,
      [
        4,
        [5],
        [6]
      ]
    ]
  ];
  var tree = Tree.fromList(treeList)..inverse();
  // print(tree.toList());
  // tree.bfs(print);
  print(tree);
  treeList.
}
