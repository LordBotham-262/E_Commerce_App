import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants.dart';

Future<int> deleteCart(int userId, int cartId) async {
  final response = await http.delete(
    Uri.parse(KServerPath + 'cart/user_id/1/cart_id/' + cartId.toString()),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    var cartCount = 0;
    var res = json.decode(response.body);
    res.forEach((abc) {
      cartCount = abc['cartCount'];
    });
    return cartCount == null ? 0 : cartCount;
  } else {
    throw Exception('Failed to delete Product');
  }
}
