import 'package:flutter/material.dart';
import 'package:my_page/component/text_component.dart';

import '../common/data/data.dart';

class EnterTextComponent extends StatelessWidget {
  final String message;
  final double sizedBoxWidthRatio;
  const EnterTextComponent({
    super.key,
    required this.message,
    this.sizedBoxWidthRatio = 0.6,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenWidth(context) * 0.6,
      child: Column(
        children:
            message.split("\n").map((x) => TextComponent(text: x)).toList(),
      ),
    );
  }
}
