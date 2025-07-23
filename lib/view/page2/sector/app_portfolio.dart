import 'package:flutter/material.dart';
import 'package:my_page/component/portfolio_component.dart';

import '../../../common/model/skils_model.dart';
import '../../../component/windows_xp_box_toggle_component.dart';

class AppPortfolio extends StatelessWidget {
  AppPortfolio({super.key});

  final List<Skils_Model> Portfolio_list = [
    Skils_Model(
      title: "Mindit - 습관 트래커 앱",
      descriptor:
          "큰 발전을 이룰수 있었던 개인 프로젝트입니다.\n처음으로 패키지를 만든 경험이 되었으며\n화면을 감지하여 락 스크린을 구현했습니다.",
      Language: "Flutter",
      Language_skil: ["Riverpod", "sqflite"],
      gif_path: "assets/images/gif/mindit_test.gif",
      isRight: true,
    ),
    Skils_Model(
      title: "Screen On Flutter",
      descriptor:
          "Flutter을 위한 락 스크린 패키지입니다.\n락 스크린은 kotlin으로 구현해야 하지만\n플러터 액티비티와 플러터 엔진을 사용하여\nFlutter 위젯을 보여줍니다",
      Language: "Kotlin",
      Language_skil: ["Service", "BroadcastReceiver"],
      gif_path: "assets/images/screen_on_flutter_test.jpg",
      isRight: false,
    ),
    Skils_Model(
      title: "Date Snap - 라벨 삽입 앱",
      descriptor:
          "날짜와 라벨을 삽입하는 앱 입니다.\n라벨의 위치는 디스플레이의 가로 세로 비율을\n참고하여 유연하게 위치를 설정합니다.",
      Language: "Flutter",
      Language_skil: [],
      gif_path: "assets/images/gif/date_snap_test.gif",
      isRight: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return WindowsXpBoxToggleComponent(
      title: '개발 포트폴리오',
      child: Column(
        children:
            Portfolio_list.map<Widget>(
              (x) => PortfolioComponent(model: x),
            ).toList(),
      ),
    );
  }
}
