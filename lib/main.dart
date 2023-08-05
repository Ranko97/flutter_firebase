import 'package:firestore_app/firebase_options.dart';
import 'package:firestore_app/routing/router.dart';
import 'package:firestore_app/themes/client_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';

void main(List<String> args) {
  MainApp().run(
    clientConfiguration: ClientConfiguration(),
  );
}

class MainApp {
  late final ClientConfiguration config;

  MainApp._internal();
  static final MainApp _singleton = MainApp._internal();
  factory MainApp() => _singleton;

  Future<void> run({
    required ClientConfiguration clientConfiguration,
  }) async {
    // Initialize class
    config = clientConfiguration;

    WidgetsFlutterBinding.ensureInitialized();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: config.colorConfig.primaryAction,
      statusBarColor: config.colorConfig.primaryAction,
    ));

    // Limit device's orientation so it doesn't go to landscape mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // // // Pass all uncaught errors from the framework to Crashlytics.
    // // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    // // FirebaseMessaging.onBackgroundMessage(
    // //     PushNotificationHandler.onBackgroundMessage);

    // // FirebaseMessaging.onMessageOpenedApp
    // //     .listen(PushNotificationHandler.onMessageOpenedApp);
    // // FirebaseMessaging.onMessage.listen(PushNotificationHandler.onMessage);

    // // // Do not allow device to go to sleep while in the app
    // // Wakelock.enable();

    runApp(
      _MainApp(
        clientConfiguration: config,
      ),
    );
  }
}

class _MainApp extends StatelessWidget {
  const _MainApp({
    Key? key,
    required this.clientConfiguration,
  }) : super(key: key);

  final ClientConfiguration clientConfiguration;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: _AppInitializerWidget(clientConfiguration: clientConfiguration),
    );
  }
}

/// This app is used to initialize services that depend on provider reference (Riverpod's providers)
class _AppInitializerWidget extends ConsumerWidget {
  const _AppInitializerWidget({
    required this.clientConfiguration,
  });

  final ClientConfiguration clientConfiguration;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // "".initTranslations(ref);

    return MaterialApp.router(
      title: clientConfiguration.displayedAppName,
      routeInformationProvider: goRouter.routeInformationProvider,
      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,
      theme: clientConfiguration.themeData,
    );
  }
}
