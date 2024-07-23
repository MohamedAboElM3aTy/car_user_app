import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData adminTheme() {
  return ThemeData(
    colorSchemeSeed: AppColors.greenSeedColor,
    fontFamily: GoogleFonts.lato().fontFamily,
    textTheme: GoogleFonts.latoTextTheme(),
  );
}
