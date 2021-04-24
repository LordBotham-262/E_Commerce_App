import 'package:shop_app/constants.dart';
import 'package:shop_app/services/network_helper.dart';

List<ProductType> categories = [];

class ProductType {
  ProductType({this.id, this.productCat,});

  final int id;
  final String productCat;

  Future<List> getCategories() async{
    String url = KServerPath + "product_type";
    List<dynamic> data = await networkHelper(url);
    data.forEach((productType) {
      final ProductType type = ProductType(
        id: productType['id'],
        productCat: productType['product_type'],
      );
      categories.add(type);
    });
    return categories;
  }

  int getCategoryId(String cat) {
    int selectedCat = 0;
    categories.forEach((element) {
        if(cat == element.productCat){
          selectedCat = element.id;
        }
      });
    return selectedCat;
  }
}