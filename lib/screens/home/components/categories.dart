import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_app/screens/home/components/productType.dart';
import '../../../constants.dart';
// We need statefull widget for our categories

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  //List<String> categories = ['Dresses','T Shirts','Pants'];
  List<String> categories = [];
  // By default our first item will be selected
  int selectedIndex = 0;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    getProduct_Type();
  }

  // void getProduct_Type() async {
  //   var categories1 =  await ProductModel().getProductType();
  //   for (var i = 0; i < categories1.length; i++) {
  //     categories.add(categories1[i]['name']);
  //   }
  // }

  void getProduct_Type() async{
    final http.Response response = await http.get(Uri.parse("http://192.168.2.204:3000/product"));
    final List<dynamic> responseData = json.decode(response.body);
    responseData.forEach((productType) {
      final ProductType type = ProductType(
          id: productType['id'],
          name: productType['name'],
          price: productType['price']
      );
      setState(() {
        categories.add(productType['name']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index].toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? kTextColor : kTextLightColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPaddin / 4), //top padding 5
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}





// class NetworkHelper {
//   NetworkHelper(this.url);
//
//   final String url;
//   Future getData() async {
//     http.Response response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       String data = response.body;
//       // print(data);
//       return jsonDecode(data);
//     } else {
//       print(response.statusCode);
//     }
//   }
// }
