import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_page/view/page2/sector/web/my_page/my_page.dart';

import '../../../../component/windows_xp_box_toggle_component.dart';
import 'appst/appst.dart';

class WebPortfolio extends StatelessWidget {
  WebPortfolio({super.key});

  final List<String> Title_list = ['APPST', 'My page'];
  final List<Widget> Portfolio_page = [Appst(), MyPage()];

  @override
  Widget build(BuildContext context) {
    return WindowsXpBoxToggleComponent(
      title: '웹 개발 포트폴리오',
      child: Column(
        children: [
          Column(
            children:
                Portfolio_page.expandIndexed<Widget>(
                  (i, x) => [
                    WindowsXpBoxToggleComponent(title: Title_list[i], child: x),
                  ],
                ).toList(),
          ),
        ],
      ),
    );
  }
}
