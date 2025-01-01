import 'package:flutter/material.dart';

class T {
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
