import 'package:flutter/material.dart';
import 'package:shop_app/screens/details/components/cart_counter.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard(
      {this.title, this.price, this.stockStatus, this.cartCount});

  final String title;
  final Text stockStatus;
  final int price, cartCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 3.0)),
          Text(
            "\₹ " + price.toString(),
            style: const TextStyle(
              fontSize: 20.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 3.0)),

          stockStatus,
          const Padding(padding: EdgeInsets.symmetric(vertical: 3.0)),
          CartCounter(cartCount),
        ],
      ),
    );
  }
}
