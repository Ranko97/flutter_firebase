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
            const LoginView(),
      ),
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
