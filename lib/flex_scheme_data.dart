import 'package:flutter/material.dart';

@immutable
class FlexSchemeData{
  const FlexSchemeData({
    required this.name,
    required this.description,
    required this.light,
    required this.dark,
  });

  final String name;
  final String description;
  final FlexSchemeColor light;
  final FlexSchemeColor dark;
}

@immutable
class FlexSchemeColor {
   const FlexSchemeColor({
    required this.primary,
    Color? primaryContainer, 
    required this.secondary,
    Color? secondaryContainer,
    Color? tertiary,
    Color? tertiaryContainer,
    this.error,
    this.errorContainer,
    @Deprecated('Use primaryContainer instead. '
        'In FlexSchemeColor old primaryContainer built-in colors were moved to '
        'the primaryContainer color since their design fitted that role best. '
        'This property was deprecated after FlexColorScheme v4.2.0.')
        Color? primaryVariant,
    @Deprecated(
        'Use secondaryContainer, tertiary or tertiaryContainer instead. '
        'In FlexSchemeColor old secondaryVariant built-in colors were moved to '
        'the tertiary color since their design fitted that role best. '
        'This property was deprecated after FlexColorScheme v4.2.0.')
        Color? secondaryVariant,
  })  : _primaryContainer = primaryContainer,
        _secondaryContainer = secondaryContainer,
        _tertiary = tertiary,
        _tertiaryContainer = tertiaryContainer,
        _primaryVariant = primaryVariant,
        _secondaryVariant = secondaryVariant;

  /// The color displayed most frequently across your application's screens
  /// and components.
  final Color primary;

  // A private color used for elements needing less emphasis than [primary],
  // set via constructor init list.
  final Color? _primaryContainer;

  /// A color used for elements needing less emphasis than [primary].
  Color get primaryContainer => _primaryContainer ?? _primaryVariant ?? primary;

  /// An accent color that, when used sparingly, calls attention to parts
  /// of your app.
  final Color secondary;

  // A private color used for elements needing less emphasis than [secondary],
  // set via constructor initializer.
  final Color? _secondaryContainer;

  //  It is only used to keep the old mapping during dev to get old color on
  //  it in example app before we have defined it.
  /// A color used for elements needing less emphasis than [secondary].
  Color get secondaryContainer =>
      _secondaryContainer ?? _secondaryVariant ?? secondary;

  // A private color used as a contrasting accent that can balance [primary]
  // and [secondary] colors or bring heightened attention to an element,
  // such as an input field, set via constructor initializer.
  final Color? _tertiary;

  /// A color used as a contrasting accent that can balance [primary]
  /// and [secondary] colors or bring heightened attention to an element,
  /// such as an input field.
  Color get tertiary => _tertiary ?? secondary;

  // A private color used for elements needing less emphasis than [tertiary],
  // set via constructor initializer.
  final Color? _tertiaryContainer;

  /// A private color used for elements needing less emphasis than [tertiary],
  Color get tertiaryContainer => _tertiaryContainer ?? _tertiary ?? secondary;

  /// The color to use for input validation errors, e.g. for
  /// [InputDecoration.errorText].
  final Color? error;

  /// A color used for error elements needing less emphasis than [error].
  final Color? errorContainer;

  // A private darker version of primary color, set via constructor init list.
  // Used to support deprecated value as null with past defaults as fallback.
  final Color? _primaryVariant;

  /// A darker version of the primary color.
  ///
  /// In Flutter SDK before v 2.10 the `primaryVariant` color is only used
  /// by [SnackBar] button color in dark theme mode as a part of predefined
  /// widget behavior.
  /// If you provide a custom [SnackBarThemeData] where you define
  /// [SnackBarThemeData.actionTextColor] to [primary] or [secondary], this
  /// color property becomes a good property to use if you need a custom color
  /// for custom widgets accessible via your application's ThemeData, that is
  /// not used as default color by any built-in widgets.
  @Deprecated('Use primaryContainer instead. '
      'In FlexSchemeColor the new primaryContainer use old primaryVariant '
      'as fallback if un-assigned in custom FlexSchemeColor schemes. '
      'An old value for it in a custom scheme, may however not be a perfect '
      'for primaryContainer in Material 3 color design. '
      'This property was deprecated after FlexColorScheme v4.2.0.')
  Color get primaryVariant => _primaryVariant ?? _primaryContainer ?? primary;

  // A private color, typically a darker version of the secondary color, set via
  // constructor initializer. Used to support deprecated value as null with
  // past defaults as fallback.
  final Color? _secondaryVariant;

  /// Typically a darker version of the secondary color.
  ///
  /// In Flutter SDK the `secondaryVariant` color is not used by in any
  /// built-in widgets default themes or predefined widget behavior.
  /// It is an excellent property to use if you need a custom color for
  /// custom widgets accessible via your application's ThemeData, that is
  /// not used as default color by any built-in widgets.
  @Deprecated('Use secondaryContainer, tertiary or tertiaryContainer instead. '
      'In FlexSchemeColor old secondaryVariant built-in colors were moved to '
      'the tertiary color since their design fitted that role best. '
      'If you in custom old FlexSchemeColor scheme use secondaryVariant and '
      'have not assigned a value to the new property secondaryContainer, it '
      'will fallback via secondaryVariant to create similar looking scheme '
      'as before by using the old secondaryVariant on new secondaryContainer. '
      'Be aware though that it may not be a perfect fit for the design intent '
      'of the new secondaryContainer color property. '
      'This property was deprecated after FlexColorScheme v4.2.0.')
  Color get secondaryVariant => _secondaryVariant ?? _tertiary ?? secondary;
}