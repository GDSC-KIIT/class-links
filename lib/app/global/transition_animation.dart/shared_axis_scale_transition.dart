import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SharedAxisScaleTransition extends CustomTransition {
  @override
  Widget buildTransition(
          BuildContext context,
          Curve? curve,
          Alignment? alignment,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child) =>
      SharedAxisTransition(
        fillColor: Get.theme.scaffoldBackgroundColor,
        animation: animation,
        secondaryAnimation: secondaryAnimation,
        transitionType: SharedAxisTransitionType.scaled,
        child: child,
      );
}
