import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> networkHelper(String url) async{
  final http.Response response = await http.get(Uri.parse(url));
  final List<dynamic> responseData = json.decode(response.body);
  return responseData;
}