import 'package:flutter/material.dart';
import 'package:my_page/component/web_portfolio_component.dart';

import '../../../../../common/model/skils_model.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});
  static const model = Skils_Model(
    Framwork: ["Flutter"],
    Language: ["Dart"],
    package: [],
    git_link: ["https://github.com/xpsa0720/my_home_page"],
    title: "My Page - 내 페이지",
    descriptor: "처음으로 만들어본 웹 페이지 입니다.\nWindows xp을 영감을 받아 만들어졌습니다.",
    Language_skil: [],
    gif_path: "assets/images/my_page.webp",
    isRight: true,
    platform: ['Web'],
    personnel: 1,
  );
  @override
  Widget build(BuildContext context) {
    return Column(children: [WebPortfolioComponent(model: model)]);
  }
}
