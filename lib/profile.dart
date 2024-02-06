import 'package:flutter/material.dart';

class Profile extends InheritedWidget {
  final Color color;

  Profile({
    required this.color,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  static Profile? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Profile>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return (oldWidget as Profile).color != color;
  }
}