import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ott_app/themes/app_colors.dart';
import 'package:ott_app/themes/sizes.dart';
import 'package:ott_app/themes/styles.dart';


class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scrollbarTheme: const ScrollbarThemeData()
        .copyWith(thumbColor: const MaterialStatePropertyAll(Colors.black)),
    primaryColor: AppColors.primaryColor.lightColor,
    canvasColor: AppColors.canvasColor.lightColor,
    dividerColor: AppColors.dividerColor.lightColor,
    disabledColor: AppColors.groundColor.lightColor?.withOpacity(0.345),
    shadowColor: AppColors.groundColor.lightColor?.withOpacity(0.33),
    dividerTheme: _getDividerThemeData(Brightness.light),
    // inputDecorationTheme: _getInputDecorationTheme(Brightness.light),
    fontFamily: 'Inter',
    splashColor: Platform.isIOS ? Colors.transparent : null,
    appBarTheme: _appBarThemeData(Brightness.light),
    textTheme: Styles.defaultTextTheme.apply(
        bodyColor: AppColors.informGreyColor.lightColor,
        displayColor: AppColors.informGreyColor.lightColor),
    inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.blue),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              style: BorderStyle.solid,
              color: Colors.blue
          ),
        )
    ),
  );

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.blue),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                style: BorderStyle.solid,
                color: Colors.blue
            ),
          )
      ),
      primaryColor: AppColors.primaryColor.darkColor,
      canvasColor: AppColors.canvasColor.darkColor,
      dividerColor: AppColors.dividerColor.darkColor,
      disabledColor: AppColors.groundColor.darkColor?.withOpacity(0.345),
      shadowColor: AppColors.groundColor.darkColor?.withOpacity(0.33),
      dividerTheme: _getDividerThemeData(Brightness.dark),
      // inputDecorationTheme: _getInputDecorationTheme(Brightness.dark),
      appBarTheme: _appBarThemeData(Brightness.dark),
      fontFamily: 'Inter',
      textTheme: Styles.defaultTextTheme.apply(
          bodyColor: AppColors.informGreyColor.darkColor,
          displayColor: AppColors.informGreyColor.darkColor),
      bottomSheetTheme: _bottomSheetThemeData(Brightness.dark),
      tabBarTheme: _getDefaultTabBarTheme(Brightness.dark),
      tooltipTheme: _getTooltipThemeData(Brightness.dark),
      // colorScheme: ColorScheme.light()
      colorScheme: _getAppColorScheme(Brightness.dark)
          .copyWith(background: AppColors.backgroundColor.darkColor)
  );

  static InputDecorationTheme _getInputDecorationTheme(Brightness brightness) {
    final secondaryTextColor = AppColors.tabSecondaryTextColor[brightness];

    final floatingLabelStyle = Styles.getBody1SemiBold()
        .copyWith(color: secondaryTextColor);
    final helperStyle = Styles.defaultTextTheme.bodySmall!
        .copyWith(color: secondaryTextColor, height: 0.8);
    final errorColor = AppColors.onErrorColor[brightness];
    final errorStyle = Styles.defaultTextTheme.bodySmall!
        .copyWith(color: errorColor, height: 0.8);

    final enabledBorderColor = AppColors.dividerColor[brightness];
    final focusedBorderColor = AppColors.primaryColor[brightness];
    final disabledBorderColor =
    AppColors.onDisabledBoundaryColor[brightness];

    InputBorder border({Color? color}) {
      return OutlineInputBorder(
        borderSide: BorderSide(color: color ?? Colors.white),
        borderRadius:
            const BorderRadius.all(Radius.circular(Size.size16)),
      );
    }

    return InputDecorationTheme(
      border: border(),
      enabledBorder: border(color: enabledBorderColor),
      focusedBorder: border(color: focusedBorderColor),
      disabledBorder: border(color: disabledBorderColor),
      errorBorder: border(color: errorColor),
      helperStyle: helperStyle,
      errorStyle: errorStyle,
      floatingLabelStyle: floatingLabelStyle,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: const EdgeInsets.all(Size.size16),
    );
  }

  static DividerThemeData _getDividerThemeData(Brightness brightness) {
    return DividerThemeData(
      color: AppColors.dividerColor[brightness],
      thickness: 0.5,
      space: 0.5,
      indent: 0,
      endIndent: 0,
    );
  }

  static AppBarTheme _appBarThemeData(Brightness brightness) {
    return AppBarTheme(
        backgroundColor: AppColors.canvasColor[brightness],
        iconTheme: IconThemeData(color: AppColors.grey6),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: brightness,
            statusBarIconBrightness: brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark,
            statusBarColor: Colors.transparent));
  }

  static ColorScheme _getAppColorScheme(Brightness brightness) {
    return ColorScheme(
        primary: AppColors.primaryColor[brightness]!,
        secondary: AppColors.secondaryColor[brightness]!,
        surface: AppColors.canvasColor[brightness]!,
        background: AppColors.backgroundColor[brightness]!,
        error: AppColors.errorColor[brightness]!,
        onPrimary: AppColors.onPrimary[brightness]!,
        onSecondary: AppColors.onSecondary[brightness]!,
        onSurface: AppColors.onSurface[brightness]!,
        onBackground: AppColors.onBackgroundColor[brightness]!,
        onError: AppColors.onErrorColor[brightness]!,
        brightness: brightness);
  }

  static BottomSheetThemeData _bottomSheetThemeData(Brightness brightness) =>
      BottomSheetThemeData(
          modalBackgroundColor:
          AppColors.groundColor[brightness]!.withOpacity(0.2),
          modalBarrierColor:
          AppColors.groundColor[brightness]?.withOpacity(0.2));

  static TabBarTheme _getDefaultTabBarTheme(Brightness brightness) {
    return TabBarTheme(
        labelColor: AppColors.informGreyColor[brightness],
        unselectedLabelColor: AppColors.tabSecondaryTextColor[brightness],
        unselectedLabelStyle: Styles.defaultTextTheme.titleSmall,
        labelStyle: Styles.defaultTextTheme.titleSmall);
  }

  static TooltipThemeData _getTooltipThemeData(Brightness brightness) {
    return const TooltipThemeData(showDuration: Duration(minutes: 10));
  }
}
