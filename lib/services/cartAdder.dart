import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constants.dart';

Future<http.Response> addItemtoCart(int id, int size, int noOfItems) {
  return http.post(Uri.parse(
      KServerPath + 'cart/user_id/1'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: requestBody,
  );
}

class CartItemList {
  CartItemList(this.cartItems);

  List<CartItem> cartItems;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'cartItems': cartItems,
  };
}

class CartItem {
  CartItem({this.productId, this.size,this.quantity});

  int productId, size , quantity;

  Map<String, dynamic> toJson() => <String, dynamic>{
      "product_id": productId,
      "size": size,
      "quantity": quantity
  };
}

final CartItemList cartItemList =
CartItemList(List<CartItem>.generate(2, (int index) {
  return CartItem(productId: 3, size:1,quantity: 1 );
}));
final String requestBody = json.encoder.convert(cartItemList);