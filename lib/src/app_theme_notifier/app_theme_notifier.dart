import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:q_theme/src/app_theme_controler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_theme_notifier.g.dart';
// @riverpod
@Riverpod(keepAlive: true)
class AppThemeNotifier extends _$AppThemeNotifier {

  @override
  AppThemeControler build(){
    return GetIt.I<AppThemeControler>();
  }

  void changeThemeMode(ThemeMode newValue) {
    if (newValue == state.themeModeSaved) return;
    state = state.copyWith(newValue);
    GetIt.I<AppThemeControler>().changeThemeMode(newValue);
  }
}

