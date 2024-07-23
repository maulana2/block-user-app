import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static final TextStyle headline1 = GoogleFonts.roboto(
    textStyle: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
  );

  static final TextStyle headline2 = GoogleFonts.lato(
    textStyle: TextStyle(
        fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
  );

  static final TextStyle bodyText1 = GoogleFonts.openSans(
    textStyle: TextStyle(
        fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
  );

  static final TextStyle bodyText2 = GoogleFonts.openSans(
    textStyle: TextStyle(
        fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),
  );
}
