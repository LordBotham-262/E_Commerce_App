import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/constants.dart';

// ignore: missing_return
Future<List> networkHelper(String url) async {
  List<dynamic> responseData = [];

  try {
    final http.Response response =
        await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
    if (response.statusCode == 200 || response.statusCode == 201) {
      responseData = json.decode(response.body);
      return responseData;
    }
  } on TimeoutException catch (e) {
    print('Timeout');
  } on Error catch (e) {
    kConnectionError = true;
    print('Error: $e');
  }
}
