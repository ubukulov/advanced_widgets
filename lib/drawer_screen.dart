import 'dart:convert';
import 'package:advanced_widgets/profile_changer.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  void changeThemeColor(Color color) {
    final profileChanger = ProfileChanger.of(context);
    if (profileChanger != null) {
      profileChanger.changeProfileColor(color);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
              children: [
                Container(
                  alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text('Выберите тему')
                ),
                Divider(
                  color: Colors.black45,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text('Черный'),
                    onTap: () {
                      changeThemeColor(Colors.black);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text('Зеленный'),
                    onTap: () {
                      changeThemeColor(Colors.green);
                    },
                  ),
                )
              ]
          ),
        )
    );
  }
}