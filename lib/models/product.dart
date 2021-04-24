import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/services/network_helper.dart';

List<Product> products= [];

class Product {
  final String image, title, description;
  final int price, size, id , type;
  final Color color;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
    this.type,
  });

  void getProducts() async{
      String url = KServerPath + "product";
      List<dynamic> responseData = await networkHelper(url);
      responseData.forEach((product) {
        final Product data = Product(
          id: product['id'],
          image: KImagePath + product['image_path'],
          title: product['name'],
          price: product['price'],
          description: product['description'],
          size: product['size'],
          color: Color(int.parse(product['color'])),
          type: product['type'],
        );
        products.add(data);
      });
    }
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

// String dummyText =
//     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
