import 'package:flutter/foundation.dart';

class HomePageProvider with ChangeNotifier {
  HomePageProvider() : _index = 0;

  int _index;
  Map<int, String> _selection = {0: 'homepage', 1: 'account'};

  int get index => _index;
  Map<int, String> get selection => _selection;

  set index(int index) {
    _index = index;
    notifyListeners();
  }
}
