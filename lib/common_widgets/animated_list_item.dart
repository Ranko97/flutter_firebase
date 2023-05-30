import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedListItem extends StatelessWidget {
  const AnimatedListItem({
    Key? key,
    required this.child,
    required this.index,
    this.delay,
  }) : super(key: key);

  final Widget child;
  final int index;
  final Duration? delay;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      delay: delay ?? const Duration(milliseconds: 100),
      child: SlideAnimation(
        child: FadeInAnimation(
          child: child,
        ),
      ),
    );
  }
}
