import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/body.dart';
import 'package:shop_app/services/authProvider.dart';

import '../appBar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({this.onSignedOut});
  final VoidCallback onSignedOut;

  void _signOut(BuildContext context) async {
    try {
      var auth = AuthProvider.of(context).auth;
      await auth.signOut();
      onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      floatingActionButton:
          FloatingActionButton(onPressed: () => _signOut(context)),
    );
  }
}
