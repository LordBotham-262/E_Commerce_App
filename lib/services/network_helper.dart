import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/constants.dart';

// ignore: missing_return
Future<List> networkHelper(String url) async {
  List<dynamic> responseData = [];
  final http.Response response = await http.get(Uri.parse(url));
  print(response.statusCode);
  if (response.statusCode == 200 || response.statusCode == 201) {
    responseData = json.decode(response.body);
    return responseData;
  } else {
    kConnectionError = true;
  }
}
