import 'package:flutter/material.dart';
import 'package:shop_app/models/cartItems.dart';
import 'package:shop_app/services/cartItemDeleter.dart';
import '../../../constants.dart';
import 'cartItemsCard.dart';

class cartBuilder extends StatefulWidget {
  cartBuilder(this.callback);
  Function(int) callback;

  @override
  _cartBuilderState createState() => _cartBuilderState();
}

class _cartBuilderState extends State<cartBuilder> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: new ListView.builder(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPaddin),
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
                    stockStatus:
                    getStockStatus(cartItems[index].stock),
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
                  onPressed: () async{
                    final status = await deleteCart(1, cartItems[index].id);
                    if(status.statusCode == 200){
                      widget.callback(1);
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
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
