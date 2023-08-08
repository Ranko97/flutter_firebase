import 'package:fireshop/app.dart';
import 'package:fireshop/constants/app_sizes.dart';
import 'package:fireshop/features/login/providers/app_info_providers.dart';
import 'package:fireshop/localization/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppVersionWidget extends ConsumerWidget {
  const AppVersionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final info = ref.watch(appInfoProvider);
    final version = info.asData?.value?.version;
    final dateNow = DateTime.now();
    return Column(
      children: [
        gapH16,
        Text(
          "© ${dateNow.year} ${"${MainApp().config.displayedAppName}. All Rights Reserved.".translate}",
          semanticsLabel:
              "${MainApp().config.displayedAppName}. All rights reserved.",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        gapH4,
        Text(
          "${"Ver.".translate}  ${version ?? ""}",
          semanticsLabel: "App Version",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
