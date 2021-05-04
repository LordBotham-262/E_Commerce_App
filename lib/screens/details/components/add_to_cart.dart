import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/services/cartAdder.dart';
import 'package:shop_app/services/cartCounter.dart';
import '../../../constants.dart';

// ignore: must_be_immutable
class AddToCart extends StatefulWidget {
  const AddToCart({
    @required this.product,
    this.noOfItems,
  });

  final Product product;
  final int noOfItems;

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {

  @override
  Widget build(BuildContext context) {
    final cartCounter = Provider.of<CartCounter>(context,listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: widget.product.color,
              ),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/add_to_cart.svg",
                color: widget.product.color,
              ),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: widget.product.color,
                onPressed: () async {
                  final cartCount = await addItemToCart(
                      widget.product.id,
                      widget.product.size,
                      widget.noOfItems == null ? 1 : widget.noOfItems);
                    cartCounter.updateCartCount(cartCount);
                },
                child: Text(
                  "Buy  Now".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
