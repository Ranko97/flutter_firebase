import 'package:fireshop/features/login/view/login_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  login,
  userinfo,
}

final GoRouter goRouter = GoRouter(
  debugLogDiagnostics: kDebugMode,
  // observers: <NavigatorObserver>[
  //   FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)
  // ],
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      name: AppRoute.login.name,
      builder: (BuildContext context, GoRouterState state) => const LoginView(),
    ),
    // GoRoute(
    //   path: "/${AppRoute.userinfo.name}",
    //   name: AppRoute.userinfo.name,
    //   builder: (BuildContext context, GoRouterState state) =>
    //       const UserInfoScreen(user: null),
    // ),
  ],
);
