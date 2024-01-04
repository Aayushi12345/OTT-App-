import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color _genuinePink = Color(0xFFD9177F);

  static const Color _primaryOnPressedGreen = Color(0xFF006A35);
  static const Color _blue = Color(0xFF394094);
  static const Color _accentPressed = Color(0xFF1EBD56);
  static const Color _positiveGreen = Color(0xFFE6F3EC);
  static const Color _positiveGreenDark = Color(0xFF001B0D);

  static const Color _connectedBlue = Color(0xFF0B78AF);
  static const Color _bulletinBlue = Color(0xFF1E9CE3);
  static const Color _linkBlue = Color(0xFF09608C);

  static const Color _passionateYellow = Color(0xFFFED418);
  static const Color _attentionYellow = Color(0xFFFFF6D1);
  static const Color _attentionYellowDark = Color(0xFF4C4007);

  static const Color goldYellow = Color(0xFFFCC132);
  static const Color whiteGlow = Color(0xFFFFFAE4);
  static const Color greenPromo = Color(0xFF10EB5E);
  static const Color greenGlow = Color(0xFF036532);
  static const Color greenIconColor = Color(0xFF008542);
  static const Color grey10 = Color(0xFF1c1719);
  static const Color dropdownColor = Color(0xff332e30);
  static const Color footerColor = Color(0xff1c1719);
  static const Color _dividerColor = Color(0xff342c2f);
  static const Color grey6 = Color(0xff777475);
  static const Color grey8 = Color(0xFF494547);
  static const Color pink = Color(0xFFF8EAE8);
  static const Color gridBackgroundColor = Color(0xFFd4d4d4);

  /// Error icons
  /// Text colour of error message
  /// Input field outline on input error
  static const Color _actionRed = Color(0xFFAE0000);
  static const Color _cautiousRed = Color(0xFFEFCCCC);
  static const Color _cautiousRedDark = Color(0xFFFF3819);

  static const Color _excitingOrange = Color(0xFFD34600);
  static const Color _excitingOrangeDark = Color(0xFFA93800);
  static const Color _honestOrange = Color(0xFFFBEDE6);

  static const Color _pureWhite = Color(0xFFFFFFFF);
  static const Color _pureDark = Color(0xFF000000);

  static const Color _foundationGrey = Color(0xFFF2F2F2);
  static const Color _foundationGreyDark = Color(0xFF0D0D0D);
  static const Color _boundaryGrey = Color(0xFFE5E5E5);
  static const Color _mellowGrey = Color(0xFFCCCCCC);
  static const Color _guidingGrey = Color(0xFF737373);
  static const Color _guidingGreyDark = Color(0xFF8C8C8C);
  static const Color _groundGrey = Color(0xFF333333);
  static const Color _informGrey = Color(0xFF191919);
  static const Color _textInfoGrey = Color(0xFF6E6E6E);
  static const Color _disclaimerGrey = Color(0xB0333333);

  static const Color _venueModeGreen = Color(0xFF072F16);
  static const Color _standingTableDivider = Color(0xFF3577AA);
  static const Color _menuIconBlack = Color(0xFF494547);
  static const Color _menuIconBorderGrey = Color(0xFFE8E8E8);
  static const Color _lightGrey = Color(0xFFEEEEEE);
  static const Color _drawerColorGrey = Color(0xFFF8F9FA);
  static const Color _drawerHeaderColor = Color(0xFFFAF2F6);
  static const Color _drawerExpansionTileColor = Color(0xFF394094);
  static const Color _grey3Color = Color(0xFFd2d1d1);
  static const Color grey7Color = Color(0xFF605D5E);

  static const Color completeTransparentColor = Color(0x00000000);
  static const Color signInBannerBgColor = Color(0xFFeff0fd);

  static final Map<Brightness, Color> mellowGreyColor =
      _buildColor(lightColor: _mellowGrey, darkColor: _groundGrey);

  static final Map<Brightness, Color> boundaryGrey =
      _buildColor(lightColor: _boundaryGrey, darkColor: _groundGrey);

  static final Map<Brightness, Color> honestOrangeColor =
      _buildColor(lightColor: _honestOrange, darkColor: _excitingOrange);

  static final Map<Brightness, Color> linkColor =
      _buildColor(lightColor: _connectedBlue, darkColor: _connectedBlue);
  static final Map<Brightness, Color> standingTableDividerColor = _buildColor(
      lightColor: _standingTableDivider, darkColor: _standingTableDivider);

  static final Map<Brightness, Color> colorTextLink =
      _buildColor(lightColor: _linkBlue, darkColor: _linkBlue);

  static final Map<Brightness, Color> accentPressedColor =
      _buildColor(lightColor: _accentPressed, darkColor: _accentPressed);

  static final Map<Brightness, Color> guidingGreyColor =
      _buildColor(lightColor: _guidingGrey, darkColor: _guidingGreyDark);

  static final Map<Brightness, Color> passionateYellowColor =
      _buildColor(lightColor: _passionateYellow, darkColor: _passionateYellow);

  static final Map<Brightness, Color> expiredRedColor =
      _buildColor(lightColor: _actionRed, darkColor: _actionRed);

  static final Map<Brightness, Color> excitingOrangeColor =
      _buildColor(lightColor: _excitingOrange, darkColor: _excitingOrange);

  static final Map<Brightness, Color> excitingOrangeDark = _buildColor(
      lightColor: _excitingOrangeDark, darkColor: _excitingOrangeDark);

  static final Map<Brightness, Color> informGreyColor =
      _buildColor(lightColor: _informGrey, darkColor: _informGrey);

  static final Map<Brightness, Color> foundationGreyColor =
      _buildColor(lightColor: _foundationGrey, darkColor: _foundationGreyDark);

  static final Map<Brightness, Color> tabLimeGreenColor =
      _buildColor(lightColor: _blue, darkColor: _blue);

  static final Map<Brightness, Color> tabSecondaryTextColor = _buildColor(
      lightColor: _groundGrey.withOpacity(0.69),
      darkColor: _groundGrey.withOpacity(0.69));

  static final Map<Brightness, Color> dividerColor =
      _buildColor(lightColor: _dividerColor, darkColor: _dividerColor);

  static final Map<Brightness, Color> groundColor =
      _buildColor(lightColor: _groundGrey, darkColor: _groundGrey);

  static final Map<Brightness, Color> primaryOnPressedColor = _buildColor(
      lightColor: _primaryOnPressedGreen, darkColor: _primaryOnPressedGreen);

  static final Map<Brightness, Color> primaryColor =
      _buildColor(lightColor: _genuinePink, darkColor: _genuinePink);

  static final Map<Brightness, Color> secondaryColor =
      _buildColor(lightColor: _blue, darkColor: _blue);

  static final Map<Brightness, Color> accentColor =
      _buildColor(lightColor: _genuinePink, darkColor: _genuinePink);

  static final Map<Brightness, Color> canvasColor =
      _buildColor(lightColor: _pureWhite, darkColor: _pureWhite);

  static final Map<Brightness, Color> backgroundColor =
      _buildColor(lightColor: _foundationGrey, darkColor: _foundationGreyDark);

  static final Map<Brightness, Color> surfaceColor =
      _buildColor(lightColor: _boundaryGrey, darkColor: _informGrey);

  static final Map<Brightness, Color> onBackgroundColor =
      _buildColor(lightColor: _informGrey, darkColor: _boundaryGrey);

  static final Map<Brightness, Color> errorColor =
      _buildColor(lightColor: _cautiousRedDark, darkColor: _cautiousRedDark);

  static final Map<Brightness, Color> onErrorColor =
      _buildColor(lightColor: _cautiousRedDark, darkColor: _cautiousRedDark);

  static final Map<Brightness, Color> onDisabledBoundaryColor =
      _buildColor(lightColor: _boundaryGrey, darkColor: _informGrey);

  static final Map<Brightness, Color> onPrimary =
      _buildColor(lightColor: _pureWhite, darkColor: _pureDark);

  static final Map<Brightness, Color> onSecondary =
      _buildColor(lightColor: _informGrey, darkColor: _boundaryGrey);

  static final Map<Brightness, Color> onSurface =
      _buildColor(lightColor: _informGrey, darkColor: _boundaryGrey);

  static final Map<Brightness, Color> onSurfaceInvert =
      _buildColor(lightColor: _pureWhite, darkColor: _pureDark);

  static final Map<Brightness, Color> passionateColor =
      _buildColor(lightColor: _passionateYellow, darkColor: _passionateYellow);

  static final Map<Brightness, Color> attentionYellowColor = _buildColor(
      lightColor: _attentionYellow, darkColor: _attentionYellowDark);

  static final Map<Brightness, Color> infoColor =
      _buildColor(lightColor: _bulletinBlue, darkColor: _bulletinBlue);

  static final Map<Brightness, Color> positiveColor =
      _buildColor(lightColor: _positiveGreen, darkColor: _positiveGreenDark);

  static final Map<Brightness, Color> venueModeColor =
      _buildColor(lightColor: _venueModeGreen, darkColor: _venueModeGreen);

  static final Map<Brightness, Color> cautiousRedColor =
      _buildColor(lightColor: _cautiousRed, darkColor: _cautiousRed);

  static final Map<Brightness, Color> textInfoGreyColor =
      _buildColor(lightColor: _textInfoGrey, darkColor: _textInfoGrey);

  static final Map<Brightness, Color> disclaimerGrey =
      _buildColor(lightColor: _disclaimerGrey, darkColor: _disclaimerGrey);

  static final Map<Brightness, Color> warningColor =
      _buildColor(lightColor: goldYellow, darkColor: goldYellow);

  static final Map<Brightness, Color> inverseSecondary = _buildColor(
      lightColor: _pureWhite.withOpacity(0.70),
      darkColor: _pureWhite.withOpacity(0.70));
  static final Map<Brightness, Color> inversePrimary =
      _buildColor(lightColor: _pureWhite, darkColor: _pureWhite);

  static final Map<Brightness, Color> footerBackgroundColor =
      _buildColor(lightColor: footerColor, darkColor: footerColor);

  static final Map<Brightness, Color> menuIconColor =
      _buildColor(lightColor: _menuIconBlack, darkColor: _menuIconBlack);

  static final Map<Brightness, Color> menuIconBorderColor = _buildColor(
      lightColor: _menuIconBorderGrey, darkColor: _menuIconBorderGrey);

  static final Map<Brightness, Color> categoryBackgroundColor =
      _buildColor(lightColor: _lightGrey, darkColor: _lightGrey);
  static final Map<Brightness, Color> drawerColorMain =
      _buildColor(lightColor: _drawerColorGrey, darkColor: _drawerColorGrey);

  static final Map<Brightness, Color> drawerColorHeader = _buildColor(
      lightColor: _drawerHeaderColor, darkColor: _drawerHeaderColor);

  static final Map<Brightness, Color> drawerExpansionTileColor = _buildColor(
      lightColor: _drawerExpansionTileColor,
      darkColor: _drawerExpansionTileColor);

  static final Map<Brightness, Color> filterItemBgColor =
      _buildColor(lightColor: _grey3Color, darkColor: _grey3Color);

  static Map<Brightness, Color> _buildColor(
      {required Color lightColor, required Color darkColor}) {
    final Map<Brightness, Color> colorMap = {};

    colorMap.putIfAbsent(Brightness.light, () => lightColor);
    colorMap.putIfAbsent(Brightness.dark, () => darkColor);

    return colorMap;
  }
}

extension ColorMap on Map<Brightness, Color> {
  Color? get lightColor => this[Brightness.light];

  Color? get darkColor => this[Brightness.dark];

  Color? platformBrightnessColor(BuildContext context) {
    // We need to check the theme mode to be able disable dark mode completely.
    // Indeed, Platform.brightness will still be `dark` even if we force the ThemeMode to be `light` in the MaterialApp.
    final ThemeMode themeMode =
        context.findAncestorWidgetOfExactType<MaterialApp>()?.themeMode ??
            ThemeMode.system;
    final Brightness brightness;

    switch (themeMode) {
      case ThemeMode.system:
        brightness = MediaQuery.of(context).platformBrightness;
        break;
      case ThemeMode.light:
        brightness = Brightness.light;
        break;
      case ThemeMode.dark:
        brightness = Brightness.dark;
        break;
    }

    return this[brightness];
  }
}
