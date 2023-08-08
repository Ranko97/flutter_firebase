import 'dart:io';

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:fireshop/features/login/providers/auth_providers.dart';
import 'package:fireshop/features/login/view/home_view.dart';
import 'package:fireshop/features/login/view/login_view.dart';
import 'package:fireshop/features/login/view/splash_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  login,
  userinfo,
  mainscreen,
  home,
  splash,
  phone,
  verifyemail,
  profile,
  emaillinksignin,
  sms,
  forgotpassword,
}

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    debugLogDiagnostics: kDebugMode,
    // observers: <NavigatorObserver>[
    //   FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)
    // ],
    routes: <GoRoute>[
      GoRoute(
          path: '/',
          name: AppRoute.login.name,
          builder: (BuildContext context, GoRouterState state) =>
              const LoginViewLocal(),
          routes: [
            GoRoute(
              path: AppRoute.forgotpassword.name,
              name: AppRoute.forgotpassword.name,
              builder: (context, state) {
                return const ForgotPasswordScreen(
                  // email: arguments?['email'],

                  headerMaxExtent: 200,
                  // headerBuilder: headerIcon(Icons.lock),
                  // sideBuilder: sideIcon(Icons.lock),
                );
              },
            ),
            GoRoute(
              path: AppRoute.emaillinksignin.name,
              name: AppRoute.emaillinksignin.name,
              builder: (context, state) {
                return EmailLinkSignInScreen(
                  actions: [
                    AuthStateChangeAction<SignedIn>((context, state) {
                      Navigator.pushReplacementNamed(context, '/');
                    }),
                  ],
                  // provider: emailLinkProviderConfig,
                  headerMaxExtent: 200,
                  // headerBuilder: headerIcon(Icons.link),
                  // sideBuilder: sideIcon(Icons.link),
                );
              },
            ),
            GoRoute(
              path: AppRoute.profile.name,
              name: AppRoute.profile.name,
              builder: (context, state) {
                return ProfileScreen(
                  actions: [
                    SignedOutAction((context) {
                      Navigator.pushReplacementNamed(context, '/');
                    }),
                    mfaAction,
                  ],
                  // actionCodeSettings: actionCodeSettings,
                  showMFATile: kIsWeb || Platform.isIOS || Platform.isAndroid,
                );
              },
            ),
          ]),
      // GoRoute(
      //   path: "/${AppRoute.mainscreen.name}",
      //   name: AppRoute.mainscreen.name,
      //   builder: (BuildContext context, GoRouterState state) =>
      //       const MainScreenView(),
      // ),
      GoRoute(
        path: "/${AppRoute.splash.name}",
        name: AppRoute.splash.name,
        builder: (context, state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: "/${AppRoute.home.name}",
        name: AppRoute.home.name,
        builder: (context, state) {
          return const HomeView();
        },
      ),

      GoRoute(
        path: "/${AppRoute.phone.name}",
        name: AppRoute.phone.name,
        builder: (context, state) {
          return PhoneInputScreen(
            actions: [
              SMSCodeRequestedAction((context, action, flowKey, phone) {
                Navigator.of(context).pushReplacementNamed(
                  '/sms',
                  arguments: {
                    'action': action,
                    'flowKey': flowKey,
                    'phone': phone,
                  },
                );
              }),
            ],
            // headerBuilder: headerIcon(Icons.phone),
            // sideBuilder: sideIcon(Icons.phone),
          );
        },
      ),

      // GoRoute(
      //   path: "/${AppRoute.sms.name}",
      //   name: AppRoute.sms.name,
      //   builder: (context, state) {
      //     return SMSCodeInputScreen(
      //       actions: [
      //         AuthStateChangeAction<SignedIn>((context, state) {
      //           Navigator.of(context).pushReplacementNamed('/profile');
      //         })
      //       ],
      //       // flowKey: arguments?['flowKey'],
      //       // action: arguments?['action'],
      //       // headerBuilder: headerIcon(Icons.sms_outlined),
      //       // sideBuilder: sideIcon(Icons.sms_outlined),
      //     );
      //   },
      // ),
    ],

    redirect: (context, state) {
      // If our async state is loading, don't perform redirects yet
      if (authState.isLoading || authState.hasError) return null;

      // Here we guarantee that hasData == true, i.e. we have a readable value

      // This has to do with how the FirebaseAuth SDK handles the "log-in" state
      // Returning `null` means "we are not authorized"
      final isAuth = authState.valueOrNull != null;

      final isSplash = state.uri.toString() == SplashView.routeLocation;
      if (isSplash) {
        return isAuth ? HomeView.routeLocation : "/";
      }

      final isLoggingIn = state.uri.toString() == "/";
      if (isLoggingIn) return isAuth ? HomeView.routeLocation : null;

      return isAuth ? null : SplashView.routeLocation;
    },
  );
});

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
