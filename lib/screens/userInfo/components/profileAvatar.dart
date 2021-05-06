import 'package:flutter/material.dart';

class profileAvatar extends StatelessWidget {
  const profileAvatar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        CircleAvatar(
          radius: 50.0,
          backgroundImage: AssetImage('assets/images/xxc.jpg'),
        ),
        Positioned(
          bottom: -10,
          right: 110,
          child: IconButton(
            icon: Icon(Icons.add_a_photo_outlined),
            color: Colors.teal,
            onPressed: () {
              print('try opening gallery');
            },
          ),
        ),
      ],
    );
  }
}