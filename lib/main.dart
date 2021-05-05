import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/services/cartCounter.dart';
import 'package:shop_app/screens/rootPage/rootPage.dart';
import 'package:shop_app/services/auth.dart';
import 'package:shop_app/services/authProvider.dart';

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
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          backgroundColor: Colors.white,
          primaryColor: Colors.white,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          accentTextTheme: GoogleFonts.sourceSansProTextTheme(
              Theme.of(context).accentTextTheme),
          inputDecorationTheme: InputDecorationTheme(
              border: InputBorder.none,
              isCollapsed: true,
              contentPadding:
                  new EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              // hasFloatingPlaceholder: false,
              floatingLabelBehavior: FloatingLabelBehavior.auto),
        ),
        home: RootPage(),
      ),
    );
  }
}
