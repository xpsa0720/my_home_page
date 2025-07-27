import 'package:flutter/material.dart';
import 'package:my_page/component/app_portfolio_component.dart';

import '../../../../../common/model/skils_model.dart';

class DataSnap extends StatelessWidget {
  DataSnap({super.key});
  final model = Skils_Model(
    Framwork: ["Flutter"],
    Language: ["Dart"],
    title: "Date Snap - 라벨 삽입 앱",
    descriptor:
        "날짜와 라벨을 삽입하는 앱 입니다.\n라벨의 위치는 디스플레이의 가로 세로 비율을\n참고하여 유연하게 위치를 설정합니다.",

    Language_skil: [],
    gif_path: "assets/images/gif/date_snap_test.gif",
    isRight: true,
    platform: ['Android'],
    personnel: 1,
  );
  @override
  Widget build(BuildContext context) {
    return Column(children: [AppPortfolioComponent(model: model)]);
  }
}
