import 'package:flutter/material.dart';
import 'package:shop_app/basicFiles/constants.dart';

class cardBuilder extends StatelessWidget {
  const cardBuilder({this.text, this.icon,this.onPress});

  final String text;
  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        child: ListTile(
          leading: Icon(icon),
          title: Text(text, style: kCardTextStyle),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}