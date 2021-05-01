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

  Future<bool> getCartItems(int i) async {
    await getCartItemsByUserId(1);
    setState(() {
      _loading = false;
    });
    return true;
  }

  callback(newAbc) async{
    getCartItems(newAbc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: cartAppBar(context,callback),
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
                  : CartBuilder(callback),
              Container(
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
