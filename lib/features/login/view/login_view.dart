import 'package:firestore_app/common_widgets/animated_list_item.dart';
import 'package:firestore_app/common_widgets/app_logo_widget.dart';
import 'package:firestore_app/common_widgets/app_version_widget.dart';
import 'package:firestore_app/common_widgets/custom_linear_progress_indicator.dart';
import 'package:firestore_app/common_widgets/responsive_center.dart';
import 'package:firestore_app/constants/app_sizes.dart';
import 'package:firestore_app/features/main_screen/view/main_screen_view.dart';
import 'package:firestore_app/localization/string_extensions.dart';
import 'package:firestore_app/main.dart';
import 'package:firestore_app/utils/messenger.dart';
import 'package:firestore_app/utils/validators.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:go_router/go_router.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  static const routeName = '/login';

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  bool loading = false;
  bool passwordVisible = false;
  var emailController = TextEditingController(text: "");
  var passwordController = TextEditingController(text: "");
  final formKey = GlobalKey<FormState>();
  DateTime? currentBackPressTime;
  // final analytics = FirebaseAnalytics.instance;

  Future<void> onLoginPressed() async {
    // if (loading) return;
    // FocusScope.of(context).unfocus();
    // if (formKey.currentState == null || !formKey.currentState!.validate()) {
    //   debugPrint("Invalid form!");
    //   return;
    // }

    // setState(() => loading = true);
    // final res = await AuthService().login(
    //   username: emailController.value.text.toString(),
    //   password: passwordController.value.text.toString(),
    //   ref: ref,
    // );

    // if (!mounted) return;

    // if (res.isRight) {
    //   analytics.logLogin();

    //   // ignore: unused_result
    //   ref.refresh(tabIndexProvider);

    //   context.go(TabsView.routeName);
    // } else {
    //   analytics.logEvent(name: "Login_Failed");

    //   Messenger.showToast(
    //       res.left ?? "Invalid user / password combination.", context);
    // }
    // setState(() => loading = false);

    context.goNamed(MainScreenView.routeName);
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 3)) {
      currentBackPressTime = now;

      Messenger.showToast("Press back arrow again to exit the app.", context);
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: onWillPop,
        child: ResponsiveCenter(
          child: SingleChildScrollView(
            padding: paddingHorizontal24,
            child: Form(
              key: formKey,
              child: AnimationLimiter(
                child: Column(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AnimatedListItem(
                          index: 0,
                          child: AppLogoWidget(),
                        ),
                        AnimatedListItem(
                          index: 1,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration:
                                InputDecoration(labelText: "Email".translate),
                            validator: MultiValidator([
                              Validators.requiredValidator,
                              Validators.emailValidator
                            ]),
                          ),
                        ),
                        gapH16,
                        AnimatedListItem(
                          index: 2,
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: !passwordVisible,
                            decoration: InputDecoration(
                                labelText: "Password".translate,
                                suffixIcon: IconButton(
                                  onPressed: () => setState(() {
                                    passwordVisible = !passwordVisible;
                                  }),
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: MainApp()
                                        .config
                                        .colorConfig
                                        .passwordSuffix,
                                  ),
                                )),
                            validator: Validators.requiredValidator,
                          ),
                        ),
                        gapH16,
                        AnimatedListItem(
                          index: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: Theme.of(context).textTheme.titleSmall,
                                  text: 'Forgot Password?',
                                  recognizer: TapGestureRecognizer()
                                    // ..onTap = () => onForgotPasswordPressed(),
                                    ..onTap = () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        gapH16,
                        AnimatedListItem(
                          index: 4,
                          child: ElevatedButton(
                            onPressed: onLoginPressed,
                            child: Text("LOGIN".translate),
                          ),
                        ),
                        gapH8,
                        CustomLinearProgressIndicator(
                          value: loading ? null : 0,
                        ),
                        AnimatedListItem(
                          index: 5,
                          child: TextButton(
                              onPressed: () {},
                              child: Text("REGISTER".translate)),
                        ),
                        gapH64,
                        const AppVersionWidget(),
                        gapH32,
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
