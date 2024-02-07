import 'package:advanced_widgets/sun.dart';
import 'package:flutter/material.dart';
import 'cloud_rain.dart';
import 'cloud_sun.dart';

class WeatherScreen extends StatefulWidget {
  final double weatherState;

  WeatherScreen({required this.weatherState, Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  double _size = 100.0;
  bool isCentered = false;

  void _updateSize() {
    setState(() {
      _size = (isCentered) ? 100.0 : 300.0;
      isCentered = !isCentered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _updateSize();
      },
      child: AnimatedSize(
        curve: Curves.easeIn,
        duration: const Duration(seconds: 1),
        child: DefineWeather(weatherState: widget.weatherState, imageSize: _size, isCentered: isCentered),
      ),
    );
  }
}

class DefineWeather extends StatelessWidget {
  double weatherState;
  double imageSize;
  bool isCentered;

  DefineWeather({required this.weatherState, required this.imageSize, required this.isCentered});

  @override
  Widget build(BuildContext context) {
    if(weatherState > 0.0 && weatherState < 0.6) {
      return (isCentered)
          ? Stack(
              children: [
                CloudSunCanvas(imageSize: imageSize, isCentered: isCentered),
                Positioned(
                  bottom: 200,
                  left: 100,
                  child: Text(
                      'Облачно, 12 градусов',
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                )
              ],
            )
          : CloudSunCanvas(imageSize: imageSize, isCentered: isCentered);

    } else if(weatherState >= 0.7 && weatherState <= 1.0) {
      return CloudRainCanvas(imageSize: imageSize, isCentered: isCentered);
    } else {
      return SunCanvas(imageSize: imageSize, isCentered: isCentered);
    }
  }
}