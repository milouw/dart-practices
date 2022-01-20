// Returns index of item in list.
// Returns -1 if item is not found.
int findLinear<T>(List<T> list, T item) {
  for (int i = 0; i < list.length; i++) {
    if (list[i] == item) return i;
  }
  return -1;
}

// Returns index of item in a sorted list.
// Returns -1 if item is not found.
int findBinary<T extends num>(List<T> list, T number) {
  int min = 0;
  int max = list.length - 1;

  while (min < max) {
    int mid = (max + min) ~/ 2;
    if (list[mid] == number)
      return mid;
    else if (number < list[mid])
      max = mid - 1;
    else if (number > list[mid]) min = mid + 1;
  }
  return -1;
}

main() {
  var l = [for (int i = 0; i < 100; i++) i * 2];
  print(findBinary(l, 21));
  print(findBinary(l, 40));
}
