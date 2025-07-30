import 'package:flutter/material.dart';

import 'package:my_page/component/link_text_component.dart';
import 'package:my_page/component/text_component.dart';

class GitLinkTextComponent extends StatelessWidget {
  final double ratio;
  final String text;
  final String link;
  const GitLinkTextComponent({
    super.key,
    this.ratio = 0.02,
    required this.text,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextComponent(text: "Github: ", ratio: ratio),
        LinkTextComponent(text: text, link: link, ratio: ratio),
      ],
    );
  }
}
