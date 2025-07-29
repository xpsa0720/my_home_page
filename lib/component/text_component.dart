import 'package:flutter/material.dart';
import 'package:my_page/common/text/style/text_style.dart';

class TextComponent extends StatelessWidget {
  final double ratio;
  final String text;
  const TextComponent({super.key, this.ratio = 0.02, required this.text});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SelectableText(
      text,
      style: Text_style.copyWith(fontSize: ratio * screenWidth),
    );
  }
}
