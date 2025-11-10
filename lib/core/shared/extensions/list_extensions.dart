import 'dart:math';

extension ListX<T> on List<T> {
  T randomItem() {
    return this[Random().nextInt(length)];
  }
}
