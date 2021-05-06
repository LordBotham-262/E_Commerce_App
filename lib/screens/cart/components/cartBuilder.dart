import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cartItems.dart';
import 'package:shop_app/services/cartServices/cartItemDeleter.dart';
import 'package:shop_app/services/cartServices/cartCounter.dart';
import '../../../basicFiles/constants.dart';
import 'cartItemsCard.dart';

// ignore: must_be_immutable
class CartBuilder extends StatefulWidget {
  CartBuilder(this.userInfo,this.updateCart);
  Function() updateCart;
  String userInfo;

  @override
  _CartBuilderState createState() => _CartBuilderState();
}

class _CartBuilderState extends State<CartBuilder> {
  @override
  Widget build(BuildContext context) {
    final cartCounter = Provider.of<CartCounter>(context, listen: false);

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      itemCount: cartItems.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Image.asset(cartItems[index].image),
              ),
              Expanded(
                flex: 3,
                child: CartItemCard(
                  title: cartItems[index].title,
                  price: cartItems[index].price,
                  stockStatus: getStockStatus(cartItems[index].stock),
                  cartCount: cartItems[index].quantity,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.delete,
                  // By default our  icon color is white
                  color: kTextColor,
                  size: 20.0,
                ),
                onPressed: () async {
                  final cartCount = await deleteCart(widget.userInfo, cartItems[index].id);
                  if (cartCount >= 0) {
                    widget.updateCart();
                    cartCounter.updateCartCount(cartCount);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

Text getStockStatus(int stock) {
  if (stock > 0) {
    return Text("ઉપલબ્ધ છે",
        style: TextStyle(
          color: Colors.green,
          fontSize: 15.0,
        ));
  } else {
    return Text("ઉપલબ્ધ નથી",
        style: TextStyle(
          color: Colors.red,
          fontSize: 15.0,
        ));
  }
}
