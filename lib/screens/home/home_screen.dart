import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/body.dart';
import 'package:shop_app/services/auth.dart';
import '../appBar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({this.auth,this.onSignedOut});
  final BaseAuth auth;
  final VoidCallback onSignedOut;

  void _signOut() async{
    try{
      await auth.signOut();
      onSignedOut();
    }
    catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,0),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: _signOut,
      ),
    );
  }
}
