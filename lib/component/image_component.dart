import 'package:flutter/material.dart';

class ImageComponent extends StatelessWidget {
  final double widthRatio;
  final String path;
  final double paddingRatio;
  const ImageComponent({
    super.key,
    this.widthRatio = 0.7,
    required this.path,
    this.paddingRatio = 0.01,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(screenWidth * paddingRatio),
      child: Image.asset(
        path,
        width: widthRatio * screenWidth,
        fit: BoxFit.cover,
      ),
    );
  }
}
