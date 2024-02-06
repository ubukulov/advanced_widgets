import 'package:advanced_widgets/profile.dart';
import 'package:flutter/material.dart';

class ProfileChanger extends StatefulWidget {
  final Widget child;

  ProfileChanger({required this.child, Key? key}) : super(key: key);

  @override
  _ProfileChangerState createState() => _ProfileChangerState();

  static _ProfileChangerState? of(BuildContext context) {
    return context.findAncestorStateOfType<_ProfileChangerState>();
  }
}

class _ProfileChangerState extends State<ProfileChanger> {
  Color _profileColor = Colors.blue;

  void changeProfileColor(Color newColor) {
    setState(() {
      _profileColor = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Profile(
      color: _profileColor,
      child: widget.child,
    );
  }
}