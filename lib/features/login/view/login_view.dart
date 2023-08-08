import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:fireshop/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginViewLocal extends StatefulWidget {
  const LoginViewLocal({super.key});

  @override
  State createState() => _LoginViewLocalState();
}

class _LoginViewLocalState extends State<LoginViewLocal> {
  @override
  Widget build(BuildContext context) {
    final mfaAction = AuthStateChangeAction<MFARequired>(
      (context, state) async {
        final nav = Navigator.of(context);

        await startMFAVerification(
          resolver: state.resolver,
          context: context,
        );

        nav.pushReplacementNamed('/profile');
      },
    );

    return SignInScreen(
      actions: [
        ForgotPasswordAction((context, email) {
          context.pushNamed(AppRoute.forgotpassword.name);
        }),
        VerifyPhoneAction((context, _) {
          context.pushNamed(AppRoute.phone.name);
        }),
        AuthStateChangeAction<SignedIn>((context, state) {
          if (!state.user!.emailVerified) {
            context.pushNamed(AppRoute.verifyemail.name);
          } else {
            context.pushNamed(AppRoute.profile.name);
          }
        }),
        AuthStateChangeAction<UserCreated>((context, state) {
          if (!state.credential.user!.emailVerified) {
            context.pushNamed(AppRoute.verifyemail.name);
          } else {
            context.pushNamed(AppRoute.profile.name);
          }
        }),
        AuthStateChangeAction<CredentialLinked>((context, state) {
          if (!state.user.emailVerified) {
            context.pushNamed(AppRoute.verifyemail.name);
          } else {
            context.pushNamed(AppRoute.profile.name);
          }
        }),
        mfaAction,
        EmailLinkSignInAction((context) {
          context.pushNamed(AppRoute.emaillinksignin.name);
        }),
      ],
      styles: const {
        EmailFormStyle(signInButtonVariant: ButtonVariant.filled),
      },
      // headerBuilder: headerImage('assets/images/flutterfire_logo.png'),
      // sideBuilder: sideImage('assets/images/flutterfire_logo.png'),
      subtitleBuilder: (context, action) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            action == AuthAction.signIn
                ? 'Welcome to Firebase UI! Please sign in to continue.'
                : 'Welcome to Firebase UI! Please create an account to continue',
          ),
        );
      },
      footerBuilder: (context, action) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              action == AuthAction.signIn
                  ? 'By signing in, you agree to our terms and conditions.'
                  : 'By registering, you agree to our terms and conditions.',
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        );
      },
    );
  }
}
