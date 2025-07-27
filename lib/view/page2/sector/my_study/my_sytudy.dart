import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_page/common/text/style/text_style.dart';

import '../../../../component/windows_xp_box_toggle_component.dart';

class MySytudy extends StatelessWidget {
  MySytudy({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return WindowsXpBoxToggleComponent(
      title: '내 학습',
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: screenWidth * 0.06),
            WhiteHatSchool(),
            SizedBox(height: screenWidth * 0.06),
            Inflearn(),
          ],
        ),
      ),
    );
  }
}

class WhiteHatSchool extends StatelessWidget {
  const WhiteHatSchool({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/whitehatschool.png",
          width: screenWidth * 0.30,
        ),
        Text(
          "화이트햇 스쿨 1기 수료",
          style: Text_style.copyWith(fontSize: screenWidth * 0.020),
        ),
        Text(
          "보안 프로젝트 PM",
          style: Text_style.copyWith(fontSize: screenWidth * 0.020),
        ),
      ],
    );
  }
}

class Inflearn extends StatelessWidget {
  const Inflearn({super.key});

  @override
  Widget build(BuildContext context) {
    final image_path_list = [
      [
        "assets/images/inflearn/javascript.png",
        "assets/images/inflearn/typescript.png",
      ],
      [
        "assets/images/inflearn/flutter_1.png",
        "assets/images/inflearn/flutter_2.png",
      ],
      [
        "assets/images/inflearn/nestjs.png",
        "assets/images/inflearn/kotlin.png",
      ],
      [
        "assets/images/inflearn/alrgorithm.gif",
        "assets/images/inflearn/zombie.gif",
      ],
    ];
    final descriptor = [
      ["자바 스크립트 강의(코드팩토리)", "타입 스크립트 강의(코드팩토리)"],
      ["플러터 초급 강의(코드팩토리)", "플러터 중급 강의(코드팩토리)"],
      ["NestJs 강의(코드팩토리)", "Kotlin 강의(개복치개발자)"],
      ["알고리즘 강의(딩코딩코)", "앱 마케팅 전략(프로그래밍좀비)"],
    ];

    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Image.asset(
          "assets/images/inflearn/inflearn_logo.png",
          width: screenWidth * 0.3,
        ),
        SizedBox(height: screenWidth * 0.03),
        Text(
          "인프런 수강 목록",
          style: Text_style.copyWith(fontSize: screenWidth * 0.035),
        ),
        Text(
          "(총 108시간)",
          style: Text_style.copyWith(fontSize: screenWidth * 0.025),
        ),
        Column(
          children:
              image_path_list
                  .expandIndexed(
                    (i, x) => [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            x
                                .expandIndexed(
                                  (j, y) => [
                                    Inflearn_mini_component(
                                      path: y,
                                      discriptor: descriptor[i][j],
                                    ),
                                    if (j != ((descriptor[i].length) - 1))
                                      SizedBox(width: screenWidth * 0.03),
                                  ],
                                )
                                .toList(),
                      ),
                      SizedBox(height: screenWidth * 0.07),
                    ],
                  )
                  .toList(),
        ),
      ],
    );
  }
}

class Inflearn_mini_component extends StatelessWidget {
  final String path;
  final String discriptor;
  const Inflearn_mini_component({
    super.key,
    required this.path,
    required this.discriptor,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            width: screenWidth * 0.3,
            child: Image.asset(path, fit: BoxFit.cover),
          ),
          SizedBox(height: screenWidth * 0.01),
          Text(
            discriptor,
            style: Text_style.copyWith(fontSize: screenWidth * 0.020),
          ),
        ],
      ),
    );
  }
}
