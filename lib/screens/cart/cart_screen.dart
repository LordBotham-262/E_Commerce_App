import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/basicFiles/constants.dart';
import 'package:shop_app/models/cartItems.dart';
import 'package:shop_app/services/cartServices/cartCounter.dart';

import 'components/cartAppBar.dart';
import 'components/cartBuilder.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "/cart";

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool _loading = true;
  var args;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        args = ModalRoute.of(context).settings.arguments;
        _loading = true;
      });
      print(args.userInfo);
      getCartItems(args.userInfo);
    });
  }

  Future<bool> getCartItems(String userId) async {
    await getCartItemsByUserId(userId);
    setState(() {
      _loading = false;
    });
    return true;
  }

  _updateCart() {
    setState(() {
      _loading = true;
    });
    getCartItems(args.userInfo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: cartAppBar(context, _updateCart,args.userInfo),
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
                      child: CartBuilder(args.userInfo,_updateCart),
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

class CartScreenPageArguments {
  final String userInfo;
  CartScreenPageArguments({@required this.userInfo});
}
