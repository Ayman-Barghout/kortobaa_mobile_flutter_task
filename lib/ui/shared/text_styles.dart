import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  TextStyle headerStyle = TextStyle(
      color: darkTextColor, fontSize: 21, fontWeight: FontWeight.bold);

  TextStyle subHeaderStyle = GoogleFonts.almarai(
    textStyle: TextStyle(
        color: darkTextColor, fontSize: 14, fontWeight: FontWeight.normal),
  );

  TextStyle lightTextStyle = TextStyle(
      color: lightTextColor, fontSize: 15, fontWeight: FontWeight.bold);
}
