import 'package:shop_app/basicFiles/constants.dart';
import 'package:shop_app/services/network_helper.dart';

List<CartItems> cartItems = [];

class CartItems {
  int id;
  int productId;
  String userId;
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

Future<dynamic> getCartItemsByUserId(String id) async {
  cartItems.clear();
  int noOfCartItems = 0;
  String url = KServerPath + "cart/user_id/" + id;
  List<dynamic> responseData = await networkHelper(url);
  responseData.forEach((json) {
    final CartItems data = CartItems(
      id: json['cart_id'],
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
    noOfCartItems = data.quantity + noOfCartItems;
  });
  return noOfCartItems;
}
