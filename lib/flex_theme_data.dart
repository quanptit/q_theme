import 'package:flutter/material.dart';

import 'flex_scheme_data.dart';

class FlexThemeData {
  static ThemeData dark(FlexSchemeData schemeData) {
    return _copyWithTheme(theme: ThemeData.dark(), flexSchemeColor: schemeData.dark);
  }

  static ThemeData light(FlexSchemeData schemeData) {
    return _copyWithTheme(theme: ThemeData.light(), flexSchemeColor: schemeData.light);
  }

  static ThemeData _copyWithTheme({required ThemeData theme, required FlexSchemeColor flexSchemeColor}) {
    return theme.copyWith(
        colorScheme: _copyColorScheme(colorScheme: theme.colorScheme, flexSchemeColor: flexSchemeColor));
  }

  static ColorScheme _copyColorScheme({required ColorScheme colorScheme, required FlexSchemeColor flexSchemeColor}) {
    return colorScheme.copyWith(
      primary: flexSchemeColor.primary,
      primaryContainer: flexSchemeColor.primaryContainer,
      secondary: flexSchemeColor.secondary,
      secondaryContainer: flexSchemeColor.secondaryContainer,
      tertiary: flexSchemeColor.tertiary,
      tertiaryContainer: flexSchemeColor.tertiaryContainer,
      error: flexSchemeColor.error,
    );
  }
}
