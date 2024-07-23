import 'package:core/app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData userTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorSchemeSeed: AppColors.blueSeedColor,
    fontFamily: GoogleFonts.lato().fontFamily,
    textTheme: GoogleFonts.latoTextTheme(),
  );
}
