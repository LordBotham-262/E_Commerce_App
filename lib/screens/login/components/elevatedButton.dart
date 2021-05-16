import 'package:flutter/material.dart';

ElevatedButton buildElevatedButton(
    String text, Color color, Function validateAndSubmit, bool _loading) {
  return ElevatedButton(
    onPressed: validateAndSubmit,
    child: Stack(
      children: [
        Visibility(visible: _loading ? false : true, child: Text(text)),
        Visibility(
            visible: _loading,
            child: CircularProgressIndicator(
              backgroundColor: Colors.orangeAccent,
            )),
      ],
    ),
    style: ElevatedButton.styleFrom(
        primary: color,
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
  );
}
