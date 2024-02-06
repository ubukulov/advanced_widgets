import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class CloudSunCanvas extends StatefulWidget {
  const CloudSunCanvas({super.key});

  @override
  _CloudSunCanvasPageState createState() => _CloudSunCanvasPageState();
}

class _CloudSunCanvasPageState extends State<CloudSunCanvas> {
  ui.Image? image;

  @override
  void initState() {
    _load('assets/images/cloud_sun.png');
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