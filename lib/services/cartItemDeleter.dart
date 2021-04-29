import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants.dart';

Future<http.Response> deleteItemfromCart(int id, int size, int noOfItems) {
  return http.delete(Uri.parse(
      KServerPath + 'cart/user_id/1/product_id/1'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}