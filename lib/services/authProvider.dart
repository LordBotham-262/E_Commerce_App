import 'package:flutter/cupertino.dart';
import 'package:shop_app/services/auth.dart';

class AuthProvider  extends InheritedWidget {
  const AuthProvider({Key key, @required Widget child,this.auth
  })  : assert(child != null),
        super(key: key, child: child);

  final BaseAuth auth;
  
  static AuthProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthProvider>();  }

  @override
  bool updateShouldNotify(AuthProvider oldWidget) => true;
  
}
