import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/cartItems.dart';
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
              _loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: new ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                          itemCount: cartItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                new Text(cartItems[index].productId.toString(),
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                                ),
                              ],
                            );
                          },
                      ),
                    ),
            ],
        ),
    );
  }
  }


class CartItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: (),
      // child: ,
    );
  }
}

