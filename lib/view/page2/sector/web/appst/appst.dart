import 'package:flutter/material.dart';
import 'package:my_page/component/web_portfolio_component.dart';

import '../../../../../common/model/skils_model.dart';

class Appst extends StatelessWidget {
  Appst({super.key});
  final model = Skils_Model(
    Framwork: ["Flutter"],
    Language: ["Dart", "TypeScript"],
    title: "APPST - 앱 개발자 커뮤니티",
    descriptor: "플레이 스토어 앱 개발자를 위한 커뮤니티입니다.\n비공개 테스트를 쉽게 하기 위해 만든 웹 서비스입니다.",

    Language_skil: [],
    gif_path: "assets/images/appst.png",
    isMaking: true,
    isRight: true,
    platform: ['Web', 'Android'],
    personnel: 1,
  );
  @override
  Widget build(BuildContext context) {
    return Column(children: [WebPortfolioComponent(model: model)]);
  }
}
