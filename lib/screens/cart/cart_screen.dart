import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/cartItems.dart';
import 'package:shop_app/screens/details/components/cart_counter.dart';
import '../appBar.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool _loading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading = true;
    getCartItems(1);
  }

  void getCartItems(int i) async {
    await getCartItemsByUserId(1);
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                child: Text(
                  "Shopping Cart",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              _loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
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
                                const Icon(
                                  Icons.more_vert,
                                  size: 16.0,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
            ]));
  }

  String getStockStatus(int stock) {
    if (stock > 0) {
      return "In Stock";
    } else {
      return "Out of Stock";
    }
  }
}

class CartItemCard extends StatelessWidget {
  const CartItemCard(
      {this.title, this.price, this.stockStatus, this.cartCount});

  final String title, stockStatus;
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
          Text(
            stockStatus,
            style: const TextStyle(
              fontSize: 20.0,
            ),
            textAlign: TextAlign.right,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 3.0)),
          CartCounter(cartCount),
        ],
      ),
    );
  }
}
