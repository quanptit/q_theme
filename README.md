### Khai báo themeData trong ứng dụng
```dart
import 'package:flutter/material.dart';
import 'package:q_theme/flex_scheme_data.dart';
import 'package:q_theme/flex_theme_data.dart';


class AppThemeData {
  static const Color materialLightErrorHc = Color(0xff790000);
  static const Color materialDarkErrorHc = Color(0xff9b374d);
  static const Color materialDarkError = Color(0xFFCF6679);

  static const FlexSchemeData mandyRed = FlexSchemeData(
    name: 'Oh Mandy red',
    description: 'Mandy red and Viking blue inspired red theme',
    light: FlexSchemeColor(
      primary: Color(0xFFCD5758),
      primaryContainer: Color(0xFFE49797),
      secondary: Color(0xFF57C8D3),
      secondaryContainer: Color(0xFF90F2FC),
      tertiary: Color(0xFF69B9CD),
      tertiaryContainer: Color(0xFFA6EDFF),
      error: materialLightErrorHc,
    ),
    dark: FlexSchemeColor(
      primary: Color(0xFFDA8585),
      primaryContainer: Color(0xFFC05253),
      secondary: Color(0xFF68CDD7),
      secondaryContainer: Color(0xFF037481),
      tertiary: Color(0xFF85C6D6),
      tertiaryContainer: Color(0xFF21859E),
      error: materialDarkError,
    ),
  );

  static ThemeData getDarkTheme() {
    return FlexThemeData.dark(mandyRed);
  }

  static ThemeData getLightTheme() {
    return FlexThemeData.light(mandyRed);
  }
}

```

### đưa THEME vào MaterialApp ở Main.dart
```dart

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ThemeMode themeModeSaved = await ThemeUtils.getCurrentSavedThemeMode();

  await initializationTest();

  runApp(ChangeNotifierProvider<AppThemeModel>(
    create: (_) => AppThemeModel(themeModeSaved),
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('Build App');
    const FlexSchemeData usedScheme = AppThemeData.mandyRed;
    return MaterialApp(
      theme: FlexThemeData.light(usedScheme),
      darkTheme: FlexThemeData.dark(usedScheme),
      themeMode: ThemeUtils.getThemeMode(context),
      .
      .
      .
      .
/*
theme: CÁi sẽ sử dụng nếu themeMode không xác định là dart.
darkTheme: sử dụng khi set themeMode = dart
*/
```

### Sử dụng `ThemeUtils.get..` để lấy color, hoặc bất cứ thông tin gì của theme

### Thêm Widget thay đổi theme ở bất cứ đâu (Left menu).

`ThemeModeSwitchDrawerMenuItem()`

`ThemeModeSwitch()`