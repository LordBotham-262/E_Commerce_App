import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/screens/details/components/body.dart';
import '../appBar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final DetailsPageArguments args =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      // each product have a color
      backgroundColor: args.product.color,
      appBar: buildAppBar(context,args.userInfo),
      body: Body(product: args.product,userInfo: args.userInfo),
    );
  }
}

class DetailsPageArguments {
  final Product product;
  final String userInfo;
  DetailsPageArguments({@required this.product,@required this.userInfo});
}