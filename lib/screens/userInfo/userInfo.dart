import 'package:flutter/material.dart';
import 'package:shop_app/basicFiles/constants.dart';
import 'components/cartListBuilder.dart';
import 'components/profileAvatar.dart';
import 'components/appBar.dart';
import 'components/cardBuilder.dart';

class UserInfo extends StatelessWidget {
  static String routeName = "/user";

  @override
  Widget build(BuildContext context) {
    final UserPageArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: userPageAppBar(context, args.userInfo),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPaddin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            profileAvatar(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Text(
                  'Dhaval Patel',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              child: Divider(
                color: Colors.teal[100],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:60),
              child: cardListBuilder(),
            ),
          ],
        ),
      ),
    );
  }
}

class UserPageArguments {
  final String userInfo;
  UserPageArguments({@required this.userInfo});
}
