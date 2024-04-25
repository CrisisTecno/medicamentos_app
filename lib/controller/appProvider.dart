import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  int _categorias = 1;

  int get categorias => _categorias;

  void setCategoria(int num) {
    _categorias = num;
    notifyListeners();
  }
}
