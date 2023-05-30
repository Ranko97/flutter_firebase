import 'package:firestore_app/main.dart';
import 'package:flutter/material.dart';

const double _kMyLinearProgressIndicatorHeight = 4.0;

class CustomLinearProgressIndicator extends LinearProgressIndicator
    implements PreferredSizeWidget {
  CustomLinearProgressIndicator({
    Key? key,
    double? value,
    Color? backgroundColor = Colors.transparent,
    Animation<Color>? valueColor,
  }) : super(
          key: key,
          value: value,
          backgroundColor: backgroundColor,
          valueColor: valueColor ??
              AlwaysStoppedAnimation<Color>(
                  MainApp().config.colorConfig.progressIndicator),
        ) {
    preferredSize =
        const Size(double.infinity, _kMyLinearProgressIndicatorHeight);
  }

  @override
  late final Size preferredSize;
}
