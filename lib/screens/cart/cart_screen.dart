import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/cartItems.dart';
import 'components/cartAppBar.dart';
import 'components/cartBuilder.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    getCartItems(1);
  }

  Future<bool> getCartItems(int userId) async {
    await getCartItemsByUserId(1);
    setState(() {
      _loading = false;
    });
    return true;
  }

  updateCart(int userId){
    setState(() {
      _loading = true;
    });
    getCartItems(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: cartAppBar(context, updateCart),
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
              Expanded(
                child: Stack(
                      children: [
                        Visibility(
                          visible: _loading ? false : true,
                          child: CartBuilder(updateCart),
                        ),
                        Visibility(
                          visible: _loading,
                          child: Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.orangeAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Center(
                  child: Text(
                    "CHECK OUT",
                    style: kLargeButtonTextStyle,
                  ),
                ),
                color: kBottomContainerColour,
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.only(bottom: 20.0),
                height: kBottomContainerHeight,
              ),
            ]));
  }
}
