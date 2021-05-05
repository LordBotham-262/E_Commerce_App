import 'package:flutter/cupertino.dart';

class CartCounter extends ChangeNotifier {
  int value = 0;
  void increment() {
    value++;
    notifyListeners();
  }

  void updateCartCount(int count) async {
    value = count ?? 0;
    notifyListeners();
  }
}
