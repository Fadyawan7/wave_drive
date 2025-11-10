import 'dart:collection';

class LimitedQueueList<T> {
  final int _maxCapacity;
  final Queue<T> _messages = Queue<T>();

  LimitedQueueList(this._maxCapacity);

  void addList(List<T> newMessages) {
    _messages.addAll(newMessages);

    while (_messages.length > _maxCapacity) {
      _messages.removeFirst();
    }
  }

  void clear() {
    _messages.clear();
  }

  List<T> toList() {
    return _messages.toList(); // Return a copy to avoid external modifications
  }
}
