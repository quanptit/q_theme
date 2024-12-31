import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_theme/q_theme.dart';

class ThemeModeSwitchDrawerMenuItem extends StatelessWidget {
  const ThemeModeSwitchDrawerMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text('Theme'),
      subtitle: Text('Light / Dart'),
      trailing: ThemeModeSwitch(),
    );
  }
}

class ThemeModeSwitch extends ConsumerWidget {
  const ThemeModeSwitch({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var isDark = (Theme.of(context).brightness == Brightness.dark);
    final List<bool> isSelected = <bool>[!isDark, isDark];
    return ToggleButtons(
      isSelected: isSelected,
      onPressed: (int newIndex) {
        debugPrint('newIndex: $newIndex');
        if (newIndex == 0) {
          ref
              .watch(appThemeNotifierProvider.notifier)
              .changeThemeMode(ThemeMode.light);
        } else {
          ref
              .watch(appThemeNotifierProvider.notifier)
              .changeThemeMode(ThemeMode.dark);
        }
      },
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: Icon(Icons.light_mode),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: Icon(Icons.bedtime),
        ),
      ],
    );
  }
}
