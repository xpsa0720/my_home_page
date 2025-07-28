import 'package:flutter/material.dart';

class SizedBoxComponent extends StatelessWidget {
  final double? widthRatio;
  final double? heightRatio;
  const SizedBoxComponent({super.key, this.widthRatio, this.heightRatio});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: widthRatio == null ? 0 : screenWidth * widthRatio!,
      height: heightRatio == null ? 0 : screenWidth * heightRatio!,
    );
  }
}
