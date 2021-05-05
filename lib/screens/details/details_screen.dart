import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/screens/details/components/body.dart';

import '../appBar.dart';

class DetailsScreen extends StatelessWidget {
  // final Product product;

  static String routeName = "/details";

  //const DetailsScreen({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DetailsPageArguments args =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      // each product have a color
      backgroundColor: args.product.color,
      appBar: buildAppBar(context),
      body: Body(product: args.product),
    );
  }
}

class DetailsPageArguments {
  final Product product;
  DetailsPageArguments({@required this.product});
}
