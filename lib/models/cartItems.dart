import 'package:shop_app/constants.dart';
import 'package:shop_app/services/network_helper.dart';
import 'product.dart';

List<CartItems> cartItems = [];

class CartItems {
  int id;
  int productId;
  int userId;
  int size;
  int quantity;
  final int price, stock;
  final String image, title;

  CartItems(
      {this.id,
      this.productId,
      this.userId,
      this.size,
      this.quantity,
      this.price,
      this.image,
      this.title,
      this.stock});
}

Future<dynamic> getCartItemsByUserId(int id) async {
  cartItems.clear();
  String url = KServerPath + "cart/user_id/" + id.toString();
  List<dynamic> responseData = await networkHelper(url);
  responseData.forEach((json) {
    final CartItems data = CartItems(
      id: json['id'],
      productId: json['product_id'],
      userId: json['user_id'],
      size: json['size'],
      quantity: json['quantity'],
      image: KImagePath + json['image_path'],
      title: json['name'],
      price: json['price'],
      stock: json['stock'],
    );
    cartItems.add(data);
  });
}
