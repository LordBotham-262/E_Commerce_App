import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/basicFiles/theme.dart';
import 'package:shop_app/screens/rootPage/rootPage.dart';
import 'package:shop_app/services/auth.dart';
import 'package:shop_app/services/authProvider.dart';
import 'package:shop_app/services/cartServices/cartCounter.dart';
import 'basicFiles/routes.dart';

void main() {
  runApp(ChangeNotifierProvider<CartCounter>(
      create: (context) => CartCounter(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Patel Shop',
        theme: theme(),
         initialRoute: RootPage.routeName,
         routes: routes,
      ),
    );
  }
}
