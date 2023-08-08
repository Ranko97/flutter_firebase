import 'package:fireshop/app.dart';
import 'package:fireshop/localization/string_extensions.dart';
import 'package:flutter/material.dart';

class Messenger {
  static void showToast(
    String text,
    BuildContext context,
  ) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(text.translate),
        action: SnackBarAction(
          label: 'OK',
          textColor: MainApp().config.colorConfig.darkBlueLogo,
          onPressed: scaffold.hideCurrentSnackBar,
        ),
      ),
    );
  }
}
