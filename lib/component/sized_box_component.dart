import 'package:flutter/material.dart';

import '../common/data/data.dart';

class SizedBoxComponent extends StatelessWidget {
  final double? widthRatio;
  final double? heightRatio;
  const SizedBoxComponent({super.key, this.widthRatio, this.heightRatio});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthRatio == null ? 0 : baseWidth * widthRatio!,
      height: heightRatio == null ? 0 : baseWidth * heightRatio!,
    );
  }
}
