import 'package:flutter/material.dart';

AppBar buildLoginAppBar() {
  return AppBar(
    elevation: 5,
    leading: IconButton(
      icon: Icon(Icons.adb, color: Colors.black),
      onPressed: () {},
      iconSize: 40,
    ),
    actions: [
      Icon(
        Icons.arrow_back_ios,
        color: Colors.pink,
      )
    ],
  );
}
