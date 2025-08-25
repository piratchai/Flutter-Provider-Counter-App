import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  bool _isEven = true;
  String _message = "Let's start counting";

  int get counter => _counter;
  bool get isEven => _isEven;
  String get message => _message;

  void increment(){
    _counter++;
    _isEven = _counter % 2 == 0;
    _message = _isEven ? "Even Number!" : "Odd Number!";
    notifyListeners();
  }

  void reset(){
    _counter = 0;
    _isEven = true;
    _message = "Counter reset!";
    notifyListeners();
  }
}