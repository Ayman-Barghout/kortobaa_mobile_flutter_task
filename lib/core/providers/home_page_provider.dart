import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePageProvider with ChangeNotifier {
  HomePageProvider() : _index = 0;

  int _index;
  Map<int, String> _selections = {0: 'homepage', 1: 'account'};

  int get index => _index;
  Map<int, String> get selections => _selections;

  set index(int index) {
    _index = index;
    notifyListeners();
  }
}
