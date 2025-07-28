import 'package:flutter/material.dart';

import '../../../../../common/model/skils_model.dart';
import '../../../../../common/text/style/text_style.dart';
import '../../../../../component/app_portfolio_component.dart';
import '../../../../../component/picture_list_component.dart';

class Mindit extends StatelessWidget {
  Mindit({super.key});
  final model = Skils_Model(
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
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        AppPortfolioComponent(model: model),
        SizedBox(height: screenWidth * 0.04),
        ScreenShot(),
        SizedBox(height: screenWidth * 0.04),
        Provider(),
        SizedBox(height: screenWidth * 0.04),
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
        "assets/images/screen_on_flutter_test.jpg",
      ],
    ];
    final screenWidth = MediaQuery.of(context).size.width;
    return PictureListComponent(
      list: screenshot_list,
      PictureWidth: screenWidth * 0.3,
      SizedBoxWidth: screenWidth * 0.02,
      SizedBoxHeight: screenWidth * 0.04,
    );
  }
}

class Provider extends StatelessWidget {
  const Provider({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Text(
          "상태관리 종속 관계",
          style: Text_style.copyWith(fontSize: screenWidth * 0.025),
        ),
        SizedBox(height: screenWidth * 0.04),
        Image.asset(
          "assets/images/mindit/mindit_provider_1.png",
          width: screenWidth * 0.6,
        ),
        SizedBox(height: screenWidth * 0.06),
        Image.asset(
          "assets/images/mindit/mindit_provider_2.png",
          width: screenWidth * 0.6,
        ),
      ],
    );
  }
}

class LockScreen extends StatelessWidget {
  const LockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Text(
          "add-to-app 기술을 이용한 락 스크린",
          style: Text_style.copyWith(fontSize: screenWidth * 0.025),
        ),
        Text(
          "(Screen on Flutter 참고)",
          style: Text_style.copyWith(fontSize: screenWidth * 0.025),
        ),
        SizedBox(height: screenWidth * 0.03),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.black),
          ),
          child: Image.asset(
            "assets/images/screen_on_flutter_test.jpg",
            width: screenWidth / 4,
          ),
        ),
        SizedBox(height: screenWidth * 0.03),
      ],
    );
  }
}
