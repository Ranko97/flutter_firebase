import 'package:flutter/material.dart';

/// Main colors used in the app.
abstract class ColorConfig {
  Color get scaffoldBackgroundColor => throw UnimplementedError();
  Color get secondaryIconBackground => throw UnimplementedError();
  Color get primaryIconBackground => throw UnimplementedError();
  Color get placeholderIconBackground => throw UnimplementedError();
  Color get iconColor => throw UnimplementedError();
  Color get tabIndicatorColor => throw UnimplementedError();
  Color get tabIconBackgroundColor => throw UnimplementedError();
  Color get tabIconForegroundColor => throw UnimplementedError();

  Color get darkBlueLogo => throw UnimplementedError();
  Color get progressIndicator => throw UnimplementedError();
  Color get primaryAction => throw UnimplementedError();
  Color get elevatedButtonColor => throw UnimplementedError();
  Color get textButtonColor => throw UnimplementedError();
  Color get enabledInputFieldBorderColor => throw UnimplementedError();
  Color get formFieldError => throw UnimplementedError();
  Color get cardBorder => throw UnimplementedError();

  // Text colors
  Color get inputLabel => throw UnimplementedError();
  Color get headlineAlt => throw UnimplementedError();
  Color get bodyText1 => throw UnimplementedError();
  Color get bodyText2 => throw UnimplementedError();
  Color get headlineText => throw UnimplementedError();
  Color get rowTextHighlighted => throw UnimplementedError();
  Color get headlineTextMediumBlue => throw UnimplementedError();
  Color get aboutAppDescription => throw UnimplementedError();

  // Icon colors
  Color get iconError => throw UnimplementedError();
  Color get iconWarning => throw UnimplementedError();
  Color get tabiconUnfocused => throw UnimplementedError();
  Color get tabLabel => throw UnimplementedError();
  Color get passwordSuffix => throw UnimplementedError();

  // Generic colors
  Color get orange => throw UnimplementedError();
  Color get red => throw UnimplementedError();
  Color get green => throw UnimplementedError();

  Map<int, Color> get primaryColorMap => throw UnimplementedError();
}
