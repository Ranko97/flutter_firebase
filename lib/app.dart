import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:fireshop/firebase_options.dart';
import 'package:fireshop/routing/router.dart';
import 'package:fireshop/src/settings/settings_controller.dart';
import 'package:fireshop/themes/client_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:firebase_ui_oauth_apple/firebase_ui_oauth_apple.dart';

class MainApp {
  late final ClientConfiguration config;
  late final SettingsController settingsController;

  MainApp._internal();
  static final MainApp _singleton = MainApp._internal();
  factory MainApp() => _singleton;

  Future<void> run({
    required ClientConfiguration clientConfiguration,
    required SettingsController settingsController,
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

    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
      // emailLinkProviderConfig,
      PhoneAuthProvider(),
      GoogleProvider(clientId: "ignore_me"),
      AppleProvider(),
    ]);

    // Do not allow device to go to sleep while in the app
    WakelockPlus.enable();

    runApp(
      ProviderScope(
        child: _MainAppInitializer(
          clientConfiguration: config,
          settingsController: settingsController,
        ),
      ),
    );
  }
}

/// This app is used to initialize services that depend on provider reference (Riverpod's providers)
class _MainAppInitializer extends ConsumerWidget {
  const _MainAppInitializer({
    required this.clientConfiguration,
    required this.settingsController,
  });

  final ClientConfiguration clientConfiguration;
  final SettingsController settingsController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // "".initTranslations(ref);
    final goRouter = ref.watch(routerProvider);

    return MaterialApp.router(
      title: clientConfiguration.displayedAppName,
      routeInformationProvider: goRouter.routeInformationProvider,
      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,
      theme: clientConfiguration.themeData,
      themeMode: settingsController.themeMode,
    );
  }
}
