import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:q_common_utils/index.dart';
import 'package:q_theme/q_theme.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_view_model.g.dart';

// @riverpod
@Riverpod(keepAlive: true)
class ThemeViewModel extends _$ThemeViewModel {
  @override
  ThemeMode build() {
    return GetIt.I<ThemeRepo>().curretThemeMode;
  }

  void iniDefault(ThemeMode initialValue) {
    state = initialValue;
  }

  Future<void> updateThemeMode(ThemeMode newValue) async {
    L.d("updateThemeMode to ${newValue.name}");
    if (newValue == state) return;
    state = newValue;
    await  GetIt.I<ThemeRepo>().saveCurrentThemeMode(newValue);
  }
}
