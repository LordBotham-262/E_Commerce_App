import 'package:shop_app/constants.dart';
import 'package:shop_app/services/network_helper.dart';

List<String> categories = [];
class ProductType {
  ProductType({this.id, this.productType,});

  final int id;
  final String productType;

  Future<List> getCategories() async{
    String url = KServerPath + "product_type";
    List<dynamic> data = await networkHelper(url);
    data.forEach((productType) {
      final ProductType type = ProductType(
        id: productType['id'],
        productType: productType['product_type'],
      );
      categories.add(productType['product_type']);
    });

    return categories;
  }
}