import 'package:firestore_app/main.dart';
import 'package:flutter/material.dart';

final lightThemeData = ThemeData(
  scaffoldBackgroundColor: MainApp().config.colorConfig.scaffoldBackgroundColor,
  primarySwatch: MaterialColor(
    MainApp().config.colorConfig.primaryAction.value,
    MainApp().config.colorConfig.primaryColorMap,
  ),
  disabledColor: Colors.grey.shade400,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(MainApp().config.borderRadiiConfig.button),
      )),
      backgroundColor: MaterialStateProperty.all<Color>(
        MainApp().config.colorConfig.elevatedButtonColor,
      ),
      foregroundColor: MaterialStateProperty.all<Color>(
        const Color(0xffffffff),
      ),
      shadowColor: MaterialStateProperty.all<Color>(
        MainApp().config.colorConfig.elevatedButtonColor,
      ),
      minimumSize:
          MaterialStateProperty.all<Size>(const Size(double.infinity, 50)),
      elevation: MaterialStateProperty.all<double>(2),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          fontFamily: "Roboto",
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: MainApp().config.colorConfig.primaryAction,
  ),
  fontFamily: "Roboto",
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: MainApp().config.colorConfig.elevatedButtonColor),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
            MainApp().config.borderRadiiConfig.inputField),
        borderSide: BorderSide(color: Colors.grey.shade200)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
            MainApp().config.borderRadiiConfig.inputField),
        borderSide: BorderSide(
            color: MainApp().config.colorConfig.enabledInputFieldBorderColor)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
            MainApp().config.borderRadiiConfig.inputField),
        borderSide:
            BorderSide(color: MainApp().config.colorConfig.primaryAction)),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
            MainApp().config.borderRadiiConfig.inputField),
        borderSide: BorderSide(color: Colors.grey.shade300)),
    contentPadding: const EdgeInsets.symmetric(
      vertical: 12,
      horizontal: 16,
    ),
    prefixStyle: const TextStyle(fontSize: 16),
    hintStyle:
        TextStyle(fontSize: 12, color: MainApp().config.colorConfig.inputLabel),
    labelStyle: TextStyle(
      fontSize: 16,
      color: MainApp().config.colorConfig.inputLabel,
      fontWeight: FontWeight.normal,
    ),
    errorStyle: TextStyle(
      color: MainApp().config.colorConfig.formFieldError,
    ),
    suffixIconColor: MainApp().config.colorConfig.passwordSuffix,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(
          MainApp().config.colorConfig.textButtonColor),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          fontFamily: "Roboto",
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    ),
  ),
  popupMenuTheme: PopupMenuThemeData(
    textStyle: TextStyle(
      fontFamily: "Roboto",
      color: Colors.grey.shade700,
      fontSize: 17,
    ),
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      color: MainApp().config.colorConfig.headlineText,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
    displayMedium: TextStyle(
      color: MainApp().config.colorConfig.headlineText,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    displaySmall: TextStyle(
      color: MainApp().config.colorConfig.headlineText,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    headlineLarge: TextStyle(
      color: MainApp().config.colorConfig.headlineText,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: TextStyle(
      color: MainApp().config.colorConfig.headlineText,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      color: MainApp().config.colorConfig.headlineText,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
    titleLarge: TextStyle(
      color: MainApp().config.colorConfig.rowTextHighlighted,
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ),
    // ! IMPORTANT: titleMedium is used for input form fields by Flutter itself
    titleMedium: TextStyle(
      color: MainApp().config.colorConfig.rowTextHighlighted,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
    titleSmall: TextStyle(
      color: MainApp().config.colorConfig.rowTextHighlighted,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: MainApp().config.colorConfig.bodyText2,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: MainApp().config.colorConfig.bodyText2,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      color: MainApp().config.colorConfig.bodyText2,
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.all<Color>(
      MainApp().config.colorConfig.primaryAction,
    ),
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontFamily: "Roboto",
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ),
  ),
);
