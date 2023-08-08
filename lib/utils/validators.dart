import 'package:fireshop/localization/string_extensions.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Validators {
  static final String requiredText = "This field is required.".translate;

  static EmailValidator emailValidator =
      EmailValidator(errorText: "Invalid email.".translate);

  static RequiredValidator requiredValidator = RequiredValidator(
    errorText: requiredText,
  );

  static final passwordPatternValidator = PatternValidator(
      r"""^(?=.*\d)(?=.*[a-zA-Z])[a-zA-Z0-9!@#$&()\.\-`.+.\=\?\^\%\|\_\"\.\',/\*]{6,}$""",
      errorText:
          "Needs to contain at least one lower, upper and one digit character."
              .translate);
}

class NumbersOnlyValidator extends TextFieldValidator {
  NumbersOnlyValidator({required String errorText}) : super(errorText);

  @override
  bool get ignoreEmptyValues => true;

  @override
  bool isValid(String? value) {
    return value?.contains(RegExp(r"^-?\d*[,.]?\d*$")) ?? true;
  }
}
