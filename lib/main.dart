import 'package:advanced_widgets/drawer_screen.dart';
import 'package:advanced_widgets/profile.dart';
import 'package:advanced_widgets/profile_changer.dart';
import 'package:advanced_widgets/weather_screen.dart';
import 'package:flutter/material.dart';
import 'cloud_sun.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileChanger(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final profileColor = Profile.of(context)?.color ?? Colors.blue;

    return Scaffold(
      key: _key,
      endDrawer: DrawerScreen(),
      appBar: AppBar(
        title: Text('Погода'),
        backgroundColor: profileColor,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              _key.currentState!.openEndDrawer();
            },
          )
        ],
      ),
      body:  WeatherScreen(weatherState: 0.0,),
    );
  }
}