import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_page/component/text_component.dart';

import '../../../../common/data/data.dart';
import '../../../../component/windows_xp_box_toggle_component.dart';

class MySytudy extends StatelessWidget {
  const MySytudy({super.key});

  @override
  Widget build(BuildContext context) {
    print("MySytudy 리빌드");
    return WindowsXpBoxToggleComponent(
      title: '내 학습',
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: ScreenWidth(context) * 0.06),
            const WhiteHatSchool(),
            SizedBox(height: ScreenWidth(context) * 0.06),
            const Inflearn(),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/whitehatschool.png",
          width: ScreenWidth(context) * 0.30,
        ),
        const TextComponent(text: "화이트햇 스쿨 1기 수료"),
        const TextComponent(text: "보안 프로젝트 PM"),
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

    return Column(
      children: [
        Image.asset(
          "assets/images/inflearn/inflearn_logo.png",
          width: ScreenWidth(context) * 0.3,
        ),
        SizedBox(height: ScreenWidth(context) * 0.03),
        const TextComponent(text: "인프런 수강 목록", ratio: 0.035),
        const TextComponent(text: "(총 108시간)", ratio: 0.025),
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
                                      SizedBox(
                                        width: ScreenWidth(context) * 0.03,
                                      ),
                                  ],
                                )
                                .toList(),
                      ),
                      SizedBox(height: ScreenWidth(context) * 0.07),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            width: ScreenWidth(context) * 0.3,
            child: Image.asset(path, fit: BoxFit.cover),
          ),
          SizedBox(height: ScreenWidth(context) * 0.01),
          TextComponent(text: discriptor, ratio: 0.020),
        ],
      ),
    );
  }
}
