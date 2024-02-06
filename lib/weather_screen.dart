import 'dart:math';
import 'dart:ui';
import 'package:advanced_widgets/sun.dart';
import 'package:flutter/material.dart';
import 'cloud_rain.dart';
import 'cloud_sun.dart';

/*class WeatherIcon extends StatelessWidget {
  final double weatherState;

  WeatherIcon({required this.weatherState, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(weatherState == 0.0) {
      return SunCanvas();
    } else if(weatherState == 0.5) {
      return CloudSunCanvas();
    } else {
      return CloudRainCanvas();
    }
  }
}*/

class WeatherScreen extends StatefulWidget {
  final double weatherState;

  WeatherScreen({required this.weatherState, Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(_controller);
    //_controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return GestureDetector(
            onTap: () {
              _controller.forward();
            },
            child: Transform.scale(
                scale: _animation.value,
                child: CloudRainCanvas(),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}