import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.lightGreen,
  textTheme: GoogleFonts.robotoTextTheme(),
);

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.green,
  scaffoldBackgroundColor: Colors.white12,
  textTheme: GoogleFonts.robotoTextTheme().apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
);
