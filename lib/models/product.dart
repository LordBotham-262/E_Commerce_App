import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/services/network_helper.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class ProductList {
  List<Product> products;

  ProductList({
    this.products,
  });

  factory ProductList.fromJson(List<dynamic> parsedJson) {

    List<Product> photos = new List<Product>();
    photos = parsedJson.map((i)=>Product.fromJson(i)).toList();

    return new ProductList(
        products: products
    );
  }
}

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
  });

  factory Product.fromJson(Map<String, dynamic> json){
    return new Product(
      id: json['id'],
            image: json['image'],
            title: json['name'],
            price: json['price'],
            description: json['description'],
            size: json['size'],
            color: json['color'],
    );
  }



  // void getProducts() async{
  //   String url = KServerPath + "product";
  //   final http.Response response = await http.get(Uri.parse(url));
  //   final List<dynamic> responseData = json.decode(response.body);
  //   responseData.forEach((product) {
  //     final Product type = Product(
  //       id: product['id'],
  //       image: product['image'],
  //       title: product['name'],
  //       price: product['price'],
  //       description: product['description'],
  //       size: product['size'],
  //       color: product['color'],
  //     );
  //     products.add(product);
  //   });
  //   print(products);
  // }

}







// List<Product> products = [
//   Product(
//       id: 1,
//       title: "Office Code",
//       price: 234,
//       size: 12,
//       description: dummyText,
//       image: KImagePath + "bag_1.png",
//       color: Color(0xFF3D82AE)),
//   Product(
//       id: 2,
//       title: "Belt Bag",
//       price: 234,
//       size: 8,
//       description: dummyText,
//       image: "assets/images/bag_2.png",
//       color: Color(0xFFD3A984)),
//   Product(
//       id: 3,
//       title: "Hang Top",
//       price: 234,
//       size: 10,
//       description: dummyText,
//       image: "assets/images/bag_3.png",
//       color: Color(0xFF989493)),
//   Product(
//       id: 4,
//       title: "Old Fashion",
//       price: 234,
//       size: 11,
//       description: dummyText,
//       image: "assets/images/bag_4.png",
//       color: Color(0xFFE6B398)),
//   Product(
//       id: 5,
//       title: "Office Code",
//       price: 234,
//       size: 12,
//       description: dummyText,
//       image: "assets/images/bag_5.png",
//       color: Color(0xFFFB7883)),
//   Product(
//     id: 6,
//     title: "Office Code",
//     price: 234,
//     size: 12,
//     description: dummyText,
//     image: "assets/images/bag_6.png",
//     color: Color(0xFFAEAEAE),
//   ),
// ];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
