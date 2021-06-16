
import 'package:flutter/cupertino.dart';

class CartModel extends ChangeNotifier {
  int _counter = 0;

  void increment() {
    _counter++;
    notifyListeners();
  }

  int get getVal => _counter;
}