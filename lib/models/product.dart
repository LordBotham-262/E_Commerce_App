import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/services/network_helper.dart';

List<Product> products = [];

class Product {
  final String image, title, description;
  final int price, size, id, type;
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
}

Future<dynamic> getProductsByCategoryId(int categoryIndex) async {
  products.clear();
  String url = KServerPath +
      "product/category_id/" +
      categoryIndex.toString() +
      "/product_id/0";
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
