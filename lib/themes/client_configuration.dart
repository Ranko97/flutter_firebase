import 'package:fireshop/api/environment_config.dart';
import 'package:fireshop/themes/border_radii_config.dart';
import 'package:fireshop/themes/color_config.dart';
import 'package:fireshop/themes/light_color_config.dart';
import 'package:fireshop/themes/light_theme.dart';
import 'package:flutter/material.dart';

class ClientConfiguration {
  /// Mustn't contain whitespaces, or dash
  String get appName => "RealtimeDatabase";
  String get displayedAppName => "Realtime Database";

  EnvironmentConfig get environmentConfig => EnvironmentConfig();

  ColorConfig get colorConfig => LightColorConfig();
  BorderRadiiConfig get borderRadiiConfig => BorderRadiiConfig();
  ThemeData get themeData => lightThemeData;

  // FirebaseOptions get firebaseOptions;
}
