import 'package:flutter/material.dart';
import 'package:shop_app/models/cartItems.dart';

import '../../../constants.dart';
import 'cartItemsCard.dart';

Expanded cartBuilder() {
  return Expanded(
    child: new ListView.builder(
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
              const Icon(
                Icons.more_vert,
                size: 16.0,
              ),
            ],
          ),
        );
      },
    ),
  );
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
