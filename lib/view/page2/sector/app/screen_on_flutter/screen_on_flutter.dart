import 'package:flutter/material.dart';

import '../../../../../common/model/skils_model.dart';
import '../../../../../component/app_portfolio_component.dart';

class ScreenOnFlutter extends StatelessWidget {
  ScreenOnFlutter({super.key});

  final model = Skils_Model(
    Framwork: ["Flutter"],
    Language: ["Dart", "Kotlin"],
    title: "Screen On Flutter",
    descriptor:
        "Flutter을 위한 락 스크린 패키지입니다.\n락 스크린은 kotlin으로 구현해야 하지만\n플러터 액티비티와 플러터 엔진을 사용하여\nFlutter 위젯을 보여줍니다",

    Language_skil: [],
    gif_path: "assets/images/screen_on_flutter_test.jpg",
    isRight: false,
    platform: ['Android'],
    personnel: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Column(children: [AppPortfolioComponent(model: model)]);
  }
}
