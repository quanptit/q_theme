import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_theme.dart';

class ThemeModeSwitchDrawerMenuItem extends StatelessWidget {
  const ThemeModeSwitchDrawerMenuItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text('Theme'),
      subtitle: Text('Light / Dart'),
      trailing: ThemeModeSwitch(),
    );
  }
}

class ThemeModeSwitch extends StatelessWidget {
  const ThemeModeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeModel>(builder: (context, appThemeModel, child) {
      var isDark = (Theme.of(context).brightness == Brightness.dark);
      final List<bool> isSelected = <bool>[!isDark, isDark];
      return ToggleButtons(
        isSelected: isSelected,
        onPressed: (int newIndex) {
          debugPrint('newIndex: $newIndex');
          if (newIndex == 0) {
            appThemeModel.themeMode = ThemeMode.light;
          } else {
            appThemeModel.themeMode = ThemeMode.dark;
          }
        },
        children: const <Widget>[
          Icon(Icons.light_mode),
          // Icon(Icons.phone_iphone),
          Icon(Icons.bedtime),
        ],
      );
    });
  }
}
