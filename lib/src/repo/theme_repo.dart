import 'package:flutter/material.dart';
import 'package:q_common_utils/index.dart';

class ThemeRepo {
  late ThemeMode curretThemeMode;

  Future<ThemeRepo> init({ThemeMode themeModeDefault = ThemeMode.system}) async {
    curretThemeMode = await _ThemeModeApi.getCurrentSavedThemeMode();
    return this;
  }

  Future<void> saveCurrentThemeMode(ThemeMode newValue) async {
    await _ThemeModeApi.saveCurrentThemeMode(newValue);
  }
}


class _ThemeModeApi {
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
}
