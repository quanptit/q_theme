
import 'package:flutter/material.dart';
import 'package:q_theme/src/t.dart';

class AppThemeControler  {
  ThemeMode? _themeModeSaved;

  Future<AppThemeControler> init() async{
    _themeModeSaved = await T.getCurrentSavedThemeMode();
    return this;
  }

  AppThemeControler copyWith(ThemeMode themeMode){
    return AppThemeControler().._themeModeSaved = themeMode;
  }

  ThemeMode get themeModeSaved => _themeModeSaved??ThemeMode.system;

  void changeThemeMode(ThemeMode newValue) {
    debugPrint('set themeMode: $newValue');
    T.saveCurrentThemeMode(newValue);
  }
}
