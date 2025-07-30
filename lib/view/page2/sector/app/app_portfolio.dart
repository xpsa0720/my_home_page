import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_page/view/page2/sector/app/mindit/mindit.dart';
import 'package:my_page/view/page2/sector/app/screen_on_flutter/screen_on_flutter.dart';

import '../../../../component/windows_xp_box_toggle_component.dart';
import 'data_snap/data_snap.dart';

class AppPortfolio extends StatelessWidget {
  const AppPortfolio({super.key});
  static const List<String> Title_list = [
    'Mind it',
    'Screen on Flutter',
    'Date Snap',
  ];
  static const List<Widget> Portfolio_page = [
    Mindit(),
    ScreenOnFlutter(),
    DataSnap(),
  ];
  @override
  Widget build(BuildContext context) {
    return WindowsXpBoxToggleComponent(
      title: '앱 개발 포트폴리오',
      child: Column(
        children:
            Portfolio_page.expandIndexed<Widget>(
              (i, x) => [
                WindowsXpBoxToggleComponent(title: Title_list[i], child: x),
              ],
            ).toList(),
      ),
    );
  }
}
