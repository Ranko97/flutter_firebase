import 'package:firestore_app/api/environment_config.dart';
import 'package:firestore_app/themes/border_radii_config.dart';
import 'package:firestore_app/themes/color_config.dart';
import 'package:firestore_app/themes/light_color_config.dart';
import 'package:firestore_app/themes/light_theme.dart';
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
