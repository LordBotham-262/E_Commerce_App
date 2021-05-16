import 'package:flutter/material.dart';
import 'package:shop_app/screens/rootPage/rootPage.dart';
import 'package:shop_app/services/authProvider.dart';
import 'cardBuilder.dart';

class cardListBuilder extends StatelessWidget {

  void _signOut(BuildContext context) async {
    try {
      var auth = AuthProvider.of(context).auth;
      await auth.signOut();
      Navigator.pushNamed(context, RootPage.routeName,);
    } catch (e) {
      print(e);
    }
  }

//  arguments: RootPageArguments(auth: AuthStatus.notSignedIn)

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        cardBuilder(
            text: "My Account", icon: Icons.account_circle_outlined),
        cardBuilder(
            text: "Notifications",
            icon: Icons.notifications_none),
        cardBuilder(
            text: "Settings", icon: Icons.settings),
        cardBuilder(
            text: "Help Center", icon: Icons.help_outline),
        cardBuilder(
            text: "Log Out", icon: Icons.logout,onPress :(){_signOut(context);}),
      ],
    );
  }
}