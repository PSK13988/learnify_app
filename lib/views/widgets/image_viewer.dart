import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({
    required this.imagePath,
    this.height,
    this.width,
    super.key,
  });

  final String imagePath;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) => Image.asset(
        imagePath,
        fit: BoxFit.cover,
        height: height ?? 250,
        width: width ?? 250,
      );
}
