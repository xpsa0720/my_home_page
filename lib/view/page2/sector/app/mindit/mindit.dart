import 'package:flutter/material.dart';

import '../../../../../common/model/skils_model.dart';
import '../../../../../component/app_portfolio_component.dart';

class Mindit extends StatelessWidget {
  Mindit({super.key});
  final model = Skils_Model(
    Framwork: ["Flutter"],
    Language: ["Dart"],
    title: "Mindit - 습관 트래커 앱",
    descriptor:
        "큰 발전을 이룰수 있었던 개인 프로젝트입니다.\n처음으로 패키지를 만든 경험이 되었으며\n화면을 감지하여 락 스크린을 구현했습니다.",

    Language_skil: ["Riverpod", "sqflite"],
    gif_path: "assets/images/gif/mindit_test.gif",
    isRight: true,
    platform: ['Android'],
    personnel: 1,
  );
  @override
  Widget build(BuildContext context) {
    return Column(children: [AppPortfolioComponent(model: model)]);
  }
}
