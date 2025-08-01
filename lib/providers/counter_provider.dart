import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    if (_count < 10) {
      _count++;
    }
    notifyListeners();
  }

  void decrement() {
    if (_count > 0) {
      _count--;
      notifyListeners();
    }
  }
}
