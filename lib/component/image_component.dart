import 'package:flutter/material.dart';

import '../common/data/data.dart';

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
    return Padding(
      padding: EdgeInsets.all(ScreenWidth(context) * paddingRatio),
      child: Image.asset(
        path,
        width: widthRatio * ScreenWidth(context),
        fit: BoxFit.cover,
        gaplessPlayback: true,
      ),
    );
  }
}
