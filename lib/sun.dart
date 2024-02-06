import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class SunCanvas extends StatefulWidget {
  const SunCanvas({super.key});

  @override
  _SunCanvasPageState createState() => _SunCanvasPageState();
}

class _SunCanvasPageState extends State<SunCanvas> {
  ui.Image? image;

  @override
  void initState() {
    _load('assets/images/sun.png');
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