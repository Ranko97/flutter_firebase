import 'package:firebase_core/firebase_core.dart';
import 'package:fireshop/firebase_options.dart';
import 'package:fireshop/routing/router.dart';
import 'package:fireshop/src/settings/settings_controller.dart';
import 'package:fireshop/themes/client_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({
//     super.key,
//     required this.settingsController,
//   });

//   final SettingsController settingsController;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: settingsController,
//       builder: (BuildContext context, Widget? child) {
//         return MaterialApp(
//           restorationScopeId: 'app',
//           localizationsDelegates: const [
//             AppLocalizations.delegate,
//             GlobalMaterialLocalizations.delegate,
//             GlobalWidgetsLocalizations.delegate,
//             GlobalCupertinoLocalizations.delegate,
//           ],
//           supportedLocales: const [
//             Locale('en', ''),
//           ],
//           onGenerateTitle: (BuildContext context) =>
//               AppLocalizations.of(context)!.appTitle,
//           theme: ThemeData(),
//           darkTheme: ThemeData.dark(),
//           themeMode: settingsController.themeMode,
//           onGenerateRoute: (RouteSettings routeSettings) {
//             return MaterialPageRoute<void>(
//               settings: routeSettings,
//               builder: (BuildContext context) {
//                 switch (routeSettings.name) {
//                   case SettingsView.routeName:
//                     return SettingsView(controller: settingsController);
//                   case SampleItemDetailsView.routeName:
//                     return const SampleItemDetailsView();
//                   case SampleItemListView.routeName:
//                   default:
//                     return const LoginView();
//                 }
//               },
//             );
//           },
//         );
//       },
//     );
//   }
// }

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

    // Do not allow device to go to sleep while in the app
    WakelockPlus.enable();

    runApp(
      _MainApp(
        clientConfiguration: config,
        settingsController: settingsController,
      ),
    );
  }
}

class _MainApp extends StatelessWidget {
  const _MainApp({
    Key? key,
    required this.clientConfiguration,
    required this.settingsController,
  }) : super(key: key);

  final ClientConfiguration clientConfiguration;
  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: _AppInitializerWidget(
        clientConfiguration: clientConfiguration,
        settingsController: settingsController,
      ),
    );
  }
}

/// This app is used to initialize services that depend on provider reference (Riverpod's providers)
class _AppInitializerWidget extends ConsumerWidget {
  const _AppInitializerWidget({
    required this.clientConfiguration,
    required this.settingsController,
  });

  final ClientConfiguration clientConfiguration;
  final SettingsController settingsController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // "".initTranslations(ref);

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
