import 'package:flutter/material.dart';

SlideTransition animatedPageRoute({
  required Animation<double> animation,
  required Widget child,
  NavigationDirection navigationDirection = NavigationDirection.right,
}) {
  return SlideTransition(
          position: Tween<Offset>(
            begin: _navigateDirectionOffset(navigationDirection),
            end: Offset.zero,
          ).animate(animation),
          child: child,);
}

enum NavigationDirection { left, right, top, bottom }

Offset _navigateDirectionOffset(NavigationDirection direction) {
  double xOffset = 0.0;
  double yOffset = 0.0;

  switch (direction) {
    case NavigationDirection.left:
      xOffset = -1.0;
      break;
    case NavigationDirection.right:
      xOffset = 1.0;
      break;
    case NavigationDirection.top:
      yOffset = -1.0;
      break;
    case NavigationDirection.bottom:
      yOffset = 1.0;
      break;
  }
  return Offset(xOffset, yOffset);
}
