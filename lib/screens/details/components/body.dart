import 'package:flutter/material.dart';
import 'package:shop_app/basicFiles/constants.dart';
import 'package:shop_app/models/product.dart';
import 'add_to_cart.dart';
import 'color_and_size.dart';
import 'counter_with_fav_btn.dart';
import 'description.dart';
import 'product_title_with_image.dart';

class Body extends StatefulWidget {
  final Product product;
  final String userInfo;
  const Body({Key key, this.product, this.userInfo}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int numOfItems = 1;

  _noOfItemsToCart(noOfItems) {
    if (numOfItems != noOfItems) {
      setState(() {
        numOfItems = noOfItems;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      ColorAndSize(product: widget.product),
                      SizedBox(height: kDefaultPaddin / 2),
                      Description(product: widget.product),
                      SizedBox(height: kDefaultPaddin / 2),
                      CounterWithFavBtn(numOfItems, _noOfItemsToCart),
                      SizedBox(height: kDefaultPaddin / 2),
                      AddToCart(product: widget.product, noOfItems: numOfItems,userInfo : widget.userInfo)
                    ],
                  ),
                ),
                ProductTitleWithImage(product: widget.product)
              ],
            ),
          )
        ],
      ),
    );
  }
}
