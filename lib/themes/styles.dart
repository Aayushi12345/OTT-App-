import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static TextTheme defaultTextTheme = TextTheme(
      displaySmall: _getHeading3(),
      headlineMedium: _getHeading4(),
      headlineSmall: _getHeading5(),
      titleLarge: _getHeading6(),
      titleMedium: _getsubtitle1(),
      titleSmall: _getSubtitle2(),
      bodyLarge: _getBody1Default(),
      bodyMedium: _getBody2Default(),
      labelLarge: _getButton1(),
      bodySmall: _getCaptionDefault(),
      labelSmall: _getOverline());

  static TextStyle _getHeading3() => GoogleFonts.inter(
        fontSize: 48,
        fontWeight: FontWeight.w400,
        letterSpacing: -2.88,
      );

  static TextStyle _getHeading4() => GoogleFonts.inter(
        fontSize: 34,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.34,
      );

  static TextStyle _getHeading5() => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.24,
      );

  static TextStyle _getHeading6() => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.2,
      );

  static TextStyle getHeadline4Monospaced() => GoogleFonts.inter(
        fontSize: 34,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.34,
      );

  static TextStyle _getsubtitle1() => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.16,
      );

  static TextStyle _getSubtitle2() => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.14,
      );

  static TextStyle _getBody1Default() => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      );

  static TextStyle getBody1SemiBold() => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.16,
      );

  static TextStyle getBody1MonoSpacedNumber() => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      );

  static TextStyle getBody1MonoSpacedNumberSemiBold() => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      );

  static TextStyle _getBody2Default() => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      );

  static TextStyle getBody2SemiBold() => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.14,
      );

  static TextStyle _getButton1() => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      );

  static TextStyle _getCaptionDefault() => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      );

  static TextStyle _getOverline() => GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      );
}
