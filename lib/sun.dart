import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class SunCanvas extends StatefulWidget {
  double imageSize;
  bool isCentered;

  SunCanvas({required this.imageSize, required this.isCentered});

  @override
  _SunCanvasPageState createState() => _SunCanvasPageState();
}

class _SunCanvasPageState extends State<SunCanvas> {
  late ui.Image image;

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
      painter: ImageInsideCanvas(image: image, imageSize: widget.imageSize, isCentered: widget.isCentered),
      child: SizedBox.expand(),
    );
  }
}

class ImageInsideCanvas extends CustomPainter {
  ImageInsideCanvas({required this.image, required this.imageSize, required this.isCentered});
  ui.Image image;
  double imageSize;
  bool isCentered;

  @override
  void paint(Canvas canvas, Size size) async {
    canvas.drawImageRect(
      image,
      Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
      (isCentered) ? Rect.fromLTWH(size.width / 2 - imageSize / 2, size.height / 2 - imageSize / 2, imageSize, imageSize) : Rect.fromLTWH(250, 0, imageSize, imageSize),
      Paint(),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}