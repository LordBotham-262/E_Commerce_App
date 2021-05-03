import 'package:shop_app/constants.dart';
import 'package:shop_app/services/network_helper.dart';

List<ProductType> productTypeList = [];

class ProductType {
  ProductType({
    this.id,
    this.productCat,
  });

  final int id;
  final String productCat;

  Future<List> getCategories() async {
    String url = KServerPath + "product_type";
    List<dynamic> data = await networkHelper(url);
    data.forEach((productType) {
      final ProductType type = ProductType(
        id: productType['id'],
        productCat: productType['product_type'],
      );
      productTypeList.add(type);
    });
    return productTypeList;
  }

  int getCategoryId(String cat) {
    int selectedCat = 0;
    productTypeList.forEach((element) {
      if (cat == element.productCat) {
        selectedCat = element.id;
      }
    });
    return selectedCat;
  }
}
