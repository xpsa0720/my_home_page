import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_page/view/page2/sector/web/my_page/my_page.dart';

import '../../../../component/windows_xp_box_toggle_component.dart';
import 'appst/appst.dart';

class WebPortfolio extends StatelessWidget {
  const WebPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> Title_list = ['APPST (현재 진행중인 프로젝트)', 'My page'];
    final List<Widget> Portfolio_page = [Appst(), MyPage()];
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
