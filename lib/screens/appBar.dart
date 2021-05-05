import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import 'cart/cart_screen.dart';
import '../services/cartCounter.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
      elevation: 5,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ));
          },
          child: Badge(
            position: BadgePosition.topEnd(top: 0, end: -10),
            animationDuration: Duration(milliseconds: 300),
            animationType: BadgeAnimationType.slide,
            badgeContent: Consumer<CartCounter>(
              builder: (_, counter, __) => Text(
                '${counter.value}',
                style: TextStyle(color: Colors.white),
              ),
            ),
            child: SvgPicture.asset(
              "assets/icons/cart.svg",
              // By default our  icon color is white
              color: kTextColor,
            ),
          ),
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ]);
}
