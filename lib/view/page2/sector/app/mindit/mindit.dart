import 'package:flutter/material.dart';
import 'package:my_page/component/text_component.dart';

import '../../../../../common/data/data.dart';
import '../../../../../common/model/skils_model.dart';
import '../../../../../component/app_portfolio_component.dart';
import '../../../../../component/picture_list_component.dart';

class Mindit extends StatelessWidget {
  Mindit({super.key});
  static const model = Skils_Model(
    Framwork: ["Flutter"],
    Language: ["Dart"],
    package: [
      "Riverpod",
      "Table Calendar",
      "skeletonizer",
      "Go Router",
      "sqflite",
      "json_annotation",
    ],
    git_link: ["https://github.com/xpsa0720/mindit"],
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
    return Column(
      children: [
        AppPortfolioComponent(model: model),
        SizedBox(height: baseWidth * 0.08),
        ScreenShot(),
        SizedBox(height: baseWidth * 0.08),
        Provider(),
        SizedBox(height: baseWidth * 0.08),
        LockScreen(),
      ],
    );
  }
}

class ScreenShot extends StatelessWidget {
  const ScreenShot({super.key});

  @override
  Widget build(BuildContext context) {
    final screenshot_list = [
      [
        "assets/images/mindit/mindit_1.jpg",
        "assets/images/mindit/mindit_3.jpg",
      ],
      [
        "assets/images/mindit/mindit_5.jpg",
        "assets/images/mindit/mindit_4.jpg",
      ],
      [
        "assets/images/mindit/mindit_2.jpg",
        "assets/images/screen_on_flutter/screen_on_flutter_test.jpg",
      ],
    ];

    return PictureListComponent(
      list: screenshot_list,
      PictureWidth: baseWidth * 0.3,
      SizedBoxWidth: baseWidth * 0.02,
      SizedBoxHeight: baseWidth * 0.04,
    );
  }
}

class Provider extends StatelessWidget {
  const Provider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextComponent(text: "상태관리 종속 관계", ratio: 0.025),
        SizedBox(height: baseWidth * 0.04),
        Image.asset(
          "assets/images/mindit/mindit_provider_1.png",
          width: baseWidth * 0.6,
        ),
        SizedBox(height: baseWidth * 0.1),
        Image.asset(
          "assets/images/mindit/mindit_provider_2.png",
          width: baseWidth * 0.6,
        ),
      ],
    );
  }
}

class LockScreen extends StatelessWidget {
  const LockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextComponent(text: "add-to-app 기술을 이용한 락 스크린", ratio: 0.025),
        const TextComponent(text: "(Screen on Flutter 참고)", ratio: 0.025),
        SizedBox(height: baseWidth * 0.03),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.black),
          ),
          child: Image.asset(
            "assets/images/screen_on_flutter/screen_on_flutter_test.jpg",
            width: baseWidth / 4,
          ),
        ),
        SizedBox(height: baseWidth * 0.03),
      ],
    );
  }
}
