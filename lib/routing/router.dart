import 'package:firestore_app/features/login/view/login_view.dart';
import 'package:firestore_app/features/main_screen/view/main_screen_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter goRouter = GoRouter(
  debugLogDiagnostics: kDebugMode,
  // observers: <NavigatorObserver>[
  //   FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)
  // ],
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      name: LoginView.routeName,
      builder: (BuildContext context, GoRouterState state) => const LoginView(),
    ),
    GoRoute(
      path: "/${MainScreenView.routeName}",
      name: MainScreenView.routeName,
      builder: (BuildContext context, GoRouterState state) =>
          const MainScreenView(),
    ),
  ],
);
