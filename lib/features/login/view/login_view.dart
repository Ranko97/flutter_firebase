import 'package:fireshop/features/google_sign_in/view/google_button.dart';
import 'package:fireshop/features/login/authentication.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 160, 16, 16),
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Text(
              'FlutterFire',
              textAlign: TextAlign.center,
            ),
            const Text(
              'Authentication',
              textAlign: TextAlign.center,
            ),
            FutureBuilder(
              future: Authentication.initializeFirebase(context: context),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Error initializing Firebase');
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return const GoogleSignInButton();
                }
                return const CircularProgressIndicator.adaptive();
              },
            ),
          ],
        ),
      ),
    );
  }
}
