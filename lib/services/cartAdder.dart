import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants.dart';


// Future<http.Response> addItemToCart(int id, int size, int noOfItems) {
//   return http.post(
//     Uri.parse(KServerPath + 'cart/user_id/1'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: json.encoder.convert(
//         CartItemList([CartItem(productId: id, size: 1, quantity: noOfItems)])),
//   );
// }

Future<int> addItemToCart(int id, int size, int noOfItems) async {
  final response = await http.post(
    Uri.parse(KServerPath + 'cart/user_id/1'),   headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  },
    body: json.encoder.convert(
        CartItemList([CartItem(productId: id, size: 1, quantity: noOfItems)])),
  );
  if (response.statusCode == 201) {
    var cartCount = 0;
    var res = json.decode(response.body);
    res.forEach((abc)
    {
      cartCount = abc['cartCount'] ;
    }
    );

    return cartCount;

  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to load album');
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
