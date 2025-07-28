import 'package:flutter/material.dart';
import 'package:my_page/common/text/style/text_style.dart';

class SizedBoxTextComponent extends StatelessWidget {
  final double ratio;
  final double widthRatio;
  final String text;
  const SizedBoxTextComponent({
    super.key,
    this.ratio = 0.02,
    required this.text,
    this.widthRatio = 0.6,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: widthRatio * screenWidth,
      child: Text(
        text,
        style: Text_style.copyWith(fontSize: ratio * screenWidth),
      ),
    );
  }
}
