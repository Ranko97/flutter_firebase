import 'package:fireshop/common_widgets/responsive_center.dart';
import 'package:fireshop/localization/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppLogoWidget extends ConsumerWidget {
  const AppLogoWidget({
    Key? key,
    this.padding,
  }) : super(key: key);

  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResponsiveCenter(
      child: Padding(
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
        child: Image(
          semanticLabel: "Logo Icon".translate,
          errorBuilder: (_, __, ___) => Text(
            "Logo Icon".translate,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          image: const AssetImage("assets/images/logo_icon.png"),
        ),
      ),
    );
  }
}
