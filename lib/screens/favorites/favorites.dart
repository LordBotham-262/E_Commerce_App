import 'package:flutter/material.dart';
import '../appBar.dart';

class FavouritesMenu extends StatelessWidget {
  static String routeName = "/favourites";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context,'1'),
        body: Text('favourites '),
      ),
    );
  }
}

