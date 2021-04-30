import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/services/cartItemDeleter.dart';
import '../../../constants.dart';


AppBar cartAppBar (BuildContext context) {
  return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
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
        IconButton(
          icon: Icon(
            Icons.delete,
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {
            deleteCart(1,0);
          },
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ]
  );
}
