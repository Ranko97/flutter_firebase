import 'package:fireshop/themes/color_config.dart';
import 'package:flutter/material.dart';

class LightColorConfig implements ColorConfig {
  @override
  Color get scaffoldBackgroundColor => const Color(0xFFF5F5F5);
  @override
  Color get secondaryIconBackground => const Color(0xFF93C8FC);
  @override
  Color get primaryIconBackground => const Color(0xFF283B8F);
  @override
  Color get placeholderIconBackground => Colors.transparent;
  @override
  Color get iconColor => Colors.white;
  @override
  Color get tabIndicatorColor => const Color(0xFF3F4577);
  @override
  Color get tabIconBackgroundColor => const Color(0xFF93C8FB);
  @override
  Color get tabIconForegroundColor => const Color(0xFF3B4352);

  @override
  Color get darkBlueLogo => const Color(0xFF40BCE1);
  @override
  Color get progressIndicator => const Color(0xFF93C8FC);
  @override
  Color get primaryAction => const Color(0xFF121A4C);
  @override
  Color get elevatedButtonColor => const Color(0xFF283B8F);
  @override
  Color get textButtonColor => const Color(0xFFA4A6A7);
  @override
  Color get enabledInputFieldBorderColor => const Color(0xFFF4F4F3);
  @override
  Color get formFieldError => const Color(0xFFBF2431);
  @override
  Color get cardBorder => const Color(0x00000000);

  // Text colors
  @override
  Color get inputLabel => const Color(0xFF858E8C);
  @override
  Color get headlineAlt => const Color(0xFF413D4A);
  @override
  Color get bodyText1 => const Color(0xFF828282);
  @override
  Color get bodyText2 => const Color(0xFF858E8C);
  @override
  Color get headlineText => const Color(0xFF252727);
  @override
  Color get rowTextHighlighted => const Color(0xFF121A4C);
  @override
  Color get headlineTextMediumBlue => const Color(0xFF252727);
  @override
  Color get aboutAppDescription => const Color(0xFF092C4C);

  // Icon colors
  @override
  Color get iconError => const Color(0xFFBF2431);
  @override
  Color get iconWarning => const Color(0xFFF4A717);
  @override
  Color get tabiconUnfocused => const Color(0xFFC2C2C2);
  @override
  Color get tabLabel => const Color(0xFF3B4352);
  @override
  Color get passwordSuffix => Colors.grey.shade400;

  // Generic colors
  @override
  Color get orange => const Color(0xFFF8CB5B);
  @override
  Color get red => const Color(0xFFBF2431);
  @override
  Color get green => const Color(0xFF10D68B);

  @override
  Map<int, Color> get primaryColorMap => {
        50: primaryAction.withOpacity(.1),
        100: primaryAction.withOpacity(.2),
        200: primaryAction.withOpacity(.3),
        300: primaryAction.withOpacity(.4),
        400: primaryAction.withOpacity(.5),
        500: primaryAction.withOpacity(.6),
        600: primaryAction.withOpacity(.7),
        700: primaryAction.withOpacity(.8),
        800: primaryAction.withOpacity(.9),
        900: primaryAction.withOpacity(1),
      };
}
