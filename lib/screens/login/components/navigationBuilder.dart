import 'package:flutter/material.dart';

Padding navigationBuilder(
    String text1, String text2, Function navigationFunction) {
  return Padding(
    padding: const EdgeInsets.only(top: 30),
    child: Row(
      children: [
        Text(
          text1,
          style: TextStyle(
            color: Colors.black26,
            fontSize: 15,
          ),
        ),
        GestureDetector(
          onTap: () {
            navigationFunction();
          },
          child: Text(
            text2,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),
          ),
        )
      ],
    ),
  );
}
