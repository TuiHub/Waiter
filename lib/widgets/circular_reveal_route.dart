import 'dart:math';

import 'package:flutter/material.dart';

class CircularRevealRoute extends PageRoute {
  CircularRevealRoute({
    required this.builder,
    this.transitionDuration = const Duration(milliseconds: 500),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor = Colors.transparent,
    this.barrierLabel = '',
    this.maintainState = true,
    this.center = Offset.zero,
    this.sizeRatio = 1,
  });

  final Offset center;
  final double sizeRatio;

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return ClipPath(
          clipper: CirclePath(
            value: animation.value,
            center: center,
            sizeRatio: sizeRatio,
          ),
          child: child,
        );
      },
      child: builder(context),
    );
  }
}

class CirclePath extends CustomClipper<Path> {
  CirclePath({
    required this.value,
    required this.center,
    required this.sizeRatio,
  });

  final double value;
  final Offset center;
  final double sizeRatio;

  @override
  Path getClip(Size size) {
    final path = Path();
    final double radius = value *
        sqrt(size.height * size.height + size.width * size.width) *
        2 *
        sizeRatio;
    path.addOval(
      Rect.fromCenter(center: center, width: radius, height: radius),
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
