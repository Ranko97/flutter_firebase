import 'package:firestore_app/common_widgets/responsive_center.dart';
import 'package:firestore_app/constants/app_sizes.dart';
import 'package:firestore_app/localization/string_extensions.dart';
import 'package:firestore_app/utils/messenger.dart';
import 'package:flutter/material.dart';

class MainScreenView extends StatefulWidget {
  const MainScreenView({Key? key}) : super(key: key);

  static const routeName = "mainscreen";

  @override
  State<MainScreenView> createState() => _MainScreenViewState();
}

class _MainScreenViewState extends State<MainScreenView> {
  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 3)) {
      currentBackPressTime = now;

      Messenger.showToast("Press back arrow again to exit the app.", context);
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Realtime Database")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text("Chat History".translate),
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: Text('New chat'.translate),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ...List.generate(
              5,
              (index) => ListTile(
                leading: const Icon(Icons.chat),
                title: Text("Dummy data $index"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            gapH64,
            const Divider(),
            ListTile(
              leading: const Icon(Icons.delete),
              title: Text('Clear conversations'.translate),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text('Log out'.translate),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: const SafeArea(
          child: Stack(
            children: [
              ResponsiveCenter(
                child: Text("Dummy text"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
