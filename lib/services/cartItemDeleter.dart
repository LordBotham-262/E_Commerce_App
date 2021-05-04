import 'package:http/http.dart' as http;
import '../constants.dart';

Future<http.Response> deleteCart(int userId, int cartId) {
  return http.delete(
    Uri.parse(KServerPath + 'cart/user_id/1/cart_id/' + cartId.toString()),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}
