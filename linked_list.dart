// Linked list
import 'dart:io';

class LinkedList<T> {
  T? value;
  LinkedList<T?>? next;

  LinkedList(this.value, this.next);

  LinkedList.fromList(List<T?> list) {
    value = list.first;
    if (list.length < 2)
      next = null;
    else
      next = LinkedList.fromList(list.sublist(1, list.length));
  }

  List<T?> toList() {
    return [value, ...?next?.toList()];
  }

  void print() {
    stdout.write("$value ");
    next?.print();
  }

  void push(T v) {
    if (next != null)
      next!.push(v);
    else
      next = LinkedList(v, null);
  }

  // Optimize before use
  // double sum() {
  //   if (value != null && value is num && next == null)
  //     return 0.0 + (value as num);
  //   else if (value == null || value is! num)
  //     return 0.0 + next?.sum();
  //   else
  //     return (value as num) + next!.sum();
  // }

  LinkedList<T?> get reversed =>
      (next?.reversed?..push(value)) ?? LinkedList(value, null);
}

void main() {
  var ll = LinkedList.fromList([1, 2, 3, 4]);
  print("List: ${ll.toList()}");
  print("Reversed: ${ll.reversed.toList()}");
}
