### Import
```
  q_theme:
    path: ./external_libs/q_theme
  flex_color_scheme: ^8.0.2
```

### Khai báo AppTheme trong ứng dụng
Vào trang của lib flex_color_scheme để chọn theme phù hợp sẽ có code mục "Theme Code".  copy code này.

app_theme.dart <file config theme. lay tu flex_color_scheme>
```dart
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/// The [AppTheme] defines light and dark themes for the app.
///
/// Theme setup for FlexColorScheme package v8.
/// Use same major flex_color_scheme package version. If you use a
/// lower minor version, some properties may not be supported.
/// In that case, remove them after copying this theme to your
/// app or upgrade package to version 8.0.2.
///
/// Use in [MaterialApp] like this:
///
/// MaterialApp(
///  theme: AppTheme.light,
///  darkTheme: AppTheme.dark,
///  :
/// );
sealed class AppTheme {
  // The defined light theme.
  static ThemeData light = FlexThemeData.light(
    scheme: FlexScheme.hippieBlue,
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
      navigationRailLabelType: NavigationRailLabelType.all,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
  // The defined dark theme.
  static ThemeData dark = FlexThemeData.dark(
    scheme: FlexScheme.hippieBlue,
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      blendOnColors: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
      navigationRailLabelType: NavigationRailLabelType.all,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
}

```

### đưa THEME vào MaterialApp ở Main.dart
```dart

registerDependencies() async {
  final getIt = GetIt.instance;
  getIt.registerSingletonAsync<AppThemeControler>(() => AppThemeControler().init());
  await getIt.allReady();
}

void main() async {
  MainUtils.firstBaseSettingForMain();
  await registerDependencies();
  ...........

}


class App extends ConsumerWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ref) {
    return MaterialApp.router(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      scaffoldMessengerKey: snackbarKey,
      themeMode: ref.watch(appThemeNotifierProvider).themeModeSaved,
      routerConfig: AppRoutes.router,
    );
  }
}


```

### Sử dụng `T.get..` để lấy color, hoặc bất cứ thông tin gì của theme

### Thêm Widget thay đổi theme ở bất cứ đâu (Left menu).
bên dưới trả về 2 controler viết sẵn UI thay đối Theme cho ứng dụng.
`ThemeModeSwitchDrawerMenuItem()`

`ThemeModeSwitch()`