import 'package:flutter/material.dart';
import 'package:my_page/common/text/style/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkTextComponent extends StatelessWidget {
  final double ratio;
  final String text;
  final String link;
  const LinkTextComponent({
    super.key,
    this.ratio = 0.02,
    required this.text,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          final url = Uri.parse(link);
          if (await canLaunchUrl(url)) {
            await launchUrl(
              url,
              mode: LaunchMode.externalApplication,
            ); // 새 탭 or 외부 브라우저
          }
        },
        child: Text(
          text,
          style: Text_style.copyWith(
            fontSize: ratio * screenWidth,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
