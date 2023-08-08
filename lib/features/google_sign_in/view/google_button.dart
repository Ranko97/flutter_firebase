import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireshop/features/google_sign_in/view/user_info_screen.dart';
import 'package:fireshop/features/login/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({super.key});

  @override
  State createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? const CircularProgressIndicator.adaptive()
          : SignInButton(
              Buttons.Google,
              onPressed: () => onButtonPressed(context),
            ),
    );
  }

  Future<void> onButtonPressed(BuildContext context) async {
    setState(() {
      _isSigningIn = true;
    });

    User? user = await Authentication.signInWithGoogle(context: context);

    setState(() {
      _isSigningIn = false;
    });

    if (user != null) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => UserInfoScreen(
            user: user,
          ),
        ),
      );
    }
  }
}
