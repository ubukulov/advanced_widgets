import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class CloudRainCanvas extends StatefulWidget {
  const CloudRainCanvas({super.key});

  @override
  _CloudRainCanvasPageState createState() => _CloudRainCanvasPageState();
}

class _CloudRainCanvasPageState extends State<CloudRainCanvas> {
  ui.Image? image;

  @override
  void initState() {
    _load('assets/images/cloud_rain.png');
    super.initState();
  }

  void _load(String path) async {
    var bytes = await rootBundle.load(path);
    image = await decodeImageFromList(bytes.buffer.asUint8List());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ImageInsideCanvas(image: image),
      child: SizedBox.expand(),
    );
  }
}

class ImageInsideCanvas extends CustomPainter {
  ImageInsideCanvas({required this.image});
  ui.Image? image;

  @override
  void paint(Canvas canvas, Size size) async {
    Paint greenBrush = Paint()..color = Colors.greenAccent;
    canvas.drawImage(image!, Offset(250, 0), greenBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}