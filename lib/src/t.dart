import 'package:flutter/material.dart';
import 'package:q_common_utils/preferences_utils.dart';

class T {
  static const keySaved = "theme_s";

  static ThemeMode _getThemeType(int? savedIndex, ThemeMode defaultTheme) {
    if (savedIndex == ThemeMode.light.index) return ThemeMode.light;
    if (savedIndex == ThemeMode.dark.index) return ThemeMode.dark;
    return defaultTheme;
  }

  static Future<ThemeMode> getCurrentSavedThemeMode({ThemeMode defaultTheme = ThemeMode.system}) async {
    return _getThemeType(await PreferencesUtils.getInt(keySaved), defaultTheme);
  }

  static Future<bool> saveCurrentThemeMode(ThemeMode themeMode) async {
    return PreferencesUtils.saveInt(keySaved, themeMode.index);
  }

  // static ThemeMode getThemeMode(BuildContext context) {
  //   return Provider.of<AppThemeModel>(context)._themeMode;
  // }

  static ThemeData getTheme(BuildContext context) {
    return Theme.of(context);
  }

  static ColorScheme getColors(BuildContext context) {
    return Theme.of(context).colorScheme;
  }

  static TextTheme textTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }

  static TextStyle? textLabelMediumOnPrimaryContainerColor(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return themeData.textTheme.labelMedium?.copyWith(color: themeData.colorScheme.onPrimaryContainer);
  }

  static TextStyle? textLabelSmallPrimaryColor(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return themeData.textTheme.labelSmall?.copyWith(color: themeData.colorScheme.primary);
  }
}
