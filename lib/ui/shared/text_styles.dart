import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle appTitleStyle = GoogleFonts.almarai(
    textStyle: TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
  );

  static const TextStyle headerStyle = TextStyle(
      color: darkTextColor, fontSize: 21, fontWeight: FontWeight.bold);

  static const TextStyle subHeaderStyle = TextStyle(
      color: darkTextColor, fontSize: 14, fontWeight: FontWeight.normal);

  static TextStyle navigationTextStyle = GoogleFonts.almarai(
    textStyle: TextStyle(
        color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
  );

  static const TextStyle lightTextStyle = TextStyle(
      color: lightTextColor, fontSize: 15, fontWeight: FontWeight.bold);
}
