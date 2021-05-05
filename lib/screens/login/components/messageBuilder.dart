import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

Row messageBuilder(text1) {
  return Row(
    children: [
      Text(
        text1,
        style:
            GoogleFonts.merriweather(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ],
  );
}
