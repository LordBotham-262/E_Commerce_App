import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/login/login_Screen.dart';
import 'package:shop_app/screens/userInfo/userInfo.dart';
import 'package:shop_app/services/authProvider.dart';

class RootPage extends StatefulWidget {
  static String routeName = '/root';

  @override
  _RootPageState createState() => _RootPageState();
}

enum AuthStatus { notSignedIn, SignedIn }

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.notSignedIn;
  String userInfo;
  var args;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // var auth = AuthProvider.of(context).auth;
    // auth.currentUser().then((userId) {
    //   setState(() {
    //     userInfo = userId;
    //     authStatus =
    //         userId == null ? AuthStatus.notSignedIn : AuthStatus.SignedIn;
    //   });
    // });
    getUserInfo();
  }

  getUserInfo() async{
  var auth = AuthProvider.of(context).auth;
  await auth.currentUser().then((userId) {
  setState(() {
  userInfo = userId;
  authStatus =
  userId == null ? AuthStatus.notSignedIn : AuthStatus.SignedIn;
  });
  });
}

  void _signedIn() {
    setState(() {
      getUserInfo();
      authStatus = AuthStatus.SignedIn;
    });

  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        args = ModalRoute.of(context).settings.arguments;
        if(args != null){ _signedOut();};
      });
    });
  }

  void _signedOut() {
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(userInfo);
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        return LoginScreen(
          onSignedIn: _signedIn,
        );
      case AuthStatus.SignedIn:
        return HomeScreen(
          onSignedOut: _signedOut,
          userInfo : userInfo,
        );
    }
  }
}


// class RootPageArguments {
//   final AuthStatus auth;
//   RootPageArguments({@required this.auth});
// }