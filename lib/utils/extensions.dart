extension ListExtensions<T> on List<T> {
  T getNext(T currentItem) {
    if (isEmpty) throw StateError('List is empty');

    final currentIndex = indexOf(currentItem);
    if (currentIndex == -1) throw ArgumentError('Item not found in the list');

    return this[(currentIndex + 1) % length];
  }
}
