import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/basicFiles/constants.dart';
import 'appBar.dart';

class UserInfo extends StatelessWidget {
  static String routeName = "/user";

  @override
  Widget build(BuildContext context) {
    final UserPageArguments args = ModalRoute.of(context).settings.arguments;
    print(args.userInfo);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal,
        appBar: userPageAppBar(context, args.userInfo),
        body: Padding(
          padding: const EdgeInsets.all(kDefaultPaddin),
          child: Center(
            child: Column(

              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/xxc.jpg'),
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.white),
                      ),
                      color: Color(0xFFF5F6F9),
                      onPressed: () {},
                      child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                ),),
                Text(
                  'Dhaval Patel',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.teal[100],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                        height: 45,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text("Orders"))),
                    Container(
                      height: 45,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Favourites List")),
                    ),
                    Container(
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Saved Addresses")),
                    ),
                    Container(
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text("SignOut"))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserPageArguments {
  final String userInfo;
  UserPageArguments({@required this.userInfo});
}
