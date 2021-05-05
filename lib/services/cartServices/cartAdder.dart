import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../basicFiles/constants.dart';

Future<int> addItemToCart(int userId, int productId, int size, int noOfItems) async {
  final response = await http.post(
    Uri.parse(KServerPath + 'cart/user_id/'+ userId.toString()),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: json.encoder.convert(
        CartItemList([CartItem(productId: productId, size: 1, quantity: noOfItems)])),
  );
  if (response.statusCode == 201) {
    var cartCount = 0;
    var res = json.decode(response.body);
    res.forEach((abc) {
      cartCount = abc['cartCount'];
    });

    return cartCount;
  } else {
    throw Exception('Failed to add product');
  }
}

class CartItemList {
  CartItemList(this.cartItems);
  List<CartItem> cartItems;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'cartItems': cartItems,
      };
}

class CartItem {
  CartItem({this.productId, this.size, this.quantity});

  int productId, size, quantity;

  Map<String, dynamic> toJson() => <String, dynamic>{
        "product_id": productId,
        "size": size,
        "quantity": quantity
      };
}
