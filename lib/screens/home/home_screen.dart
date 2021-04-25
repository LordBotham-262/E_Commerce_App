import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/body.dart';
import '../appBar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }
}
