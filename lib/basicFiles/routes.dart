import 'package:flutter/widgets.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/favorites/favorites.dart';
import 'package:shop_app/screens/rootPage/rootPage.dart';
import 'package:shop_app/screens/userInfo/userInfo.dart';

final Map<String, WidgetBuilder> routes = {
  RootPage.routeName : (context) => RootPage(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName:(context) => CartScreen(),
  UserInfo.routeName:(context) => UserInfo(),
  FavouritesMenu.routeName : (context) => FavouritesMenu(),
};

