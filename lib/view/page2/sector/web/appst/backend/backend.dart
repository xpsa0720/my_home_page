import 'package:flutter/material.dart';
import 'package:my_page/component/git_link_text_component.dart';
import 'package:my_page/component/image_component.dart';
import 'package:my_page/component/text_component.dart';

import '../../../../../../common/data/data.dart';
import '../../../../../../common/model/skils_model.dart';

class Backend extends StatelessWidget {
  final Skils_Model model;
  const Backend({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: baseWidth * 0.04),

              // Design(),
              // SizedBox(height: baseWidth * 0.04),
              Architecture(),
              SizedBox(height: baseWidth * 0.02),

              const GitLinkTextComponent(
                text: "링크",
                link: "https://github.com/xpsa0720/appst_backend",
                ratio: 0.03,
              ),
              SizedBox(height: baseWidth * 0.1),
              DataBase(),
              SizedBox(height: baseWidth * 0.1),
              NestJS(),
              SizedBox(height: baseWidth * 0.05),
              Current(),
              SizedBox(height: baseWidth * 0.1),
            ],
          ),
        ),
      ],
    );
  }
}

class NestJS extends StatelessWidget {
  const NestJS({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextComponent(ratio: 0.03, text: "NestJS 요청-응답 Lifecycle"),
        SizedBox(height: baseWidth * 0.02),
        const ImageComponent(path: "assets/images/appst/appst_8.png"),
      ],
    );
  }
}

class DataBase extends StatelessWidget {
  const DataBase({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextComponent(ratio: 0.03, text: "DataBase ERD(현재)"),
        SizedBox(height: baseWidth * 0.02),
        const ImageComponent(path: "assets/images/appst/appst_erd.png"),
      ],
    );
  }
}

class Architecture extends StatelessWidget {
  const Architecture({super.key});
  @override
  Widget build(BuildContext context) {
    final title = ["DataBase", "인증 방식", "통신 방식", "프레임워크", "서버"];
    final content = [
      "Postgresql",
      "JWT + RefreshToken",
      "Rest API",
      "NestJs + TypeORM",
      "AWS 배포(예정)",
    ];

    return Column(
      children: [
        const TextComponent(text: "아키텍쳐 개요", ratio: 0.03),
        SizedBox(height: baseWidth * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: baseWidth * 0.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    title
                        .map((x) => TextComponent(text: x + ":", ratio: 0.025))
                        .toList(),
              ),
            ),
            SizedBox(
              width: baseWidth * 0.25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    content
                        .map((x) => TextComponent(text: x, ratio: 0.025))
                        .toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Current extends StatelessWidget {
  const Current({super.key});

  @override
  Widget build(BuildContext context) {
    const message = "Mutual Install System 구현(개요 참고)";
    final success_task = [
      "로그인 기능(JWT 인증)",
      "회원 가입 기능, 이메일 인증",
      "설치 인증 요청 및 확인",
      "게시물 업로드,삭제",
    ];
    return Column(
      children: [
        const TextComponent(ratio: 0.03, text: "현재 완료한 작업"),
        SizedBox(height: baseWidth * 0.01),
        ...success_task
            .map((x) => TextComponent(text: x, ratio: 0.025))
            .toList(),
        SizedBox(height: baseWidth * 0.1),
        const TextComponent(ratio: 0.03, text: "현재 진행중인 작업"),
        SizedBox(height: baseWidth * 0.02),
        ...message
            .split("\n")
            .map((x) => TextComponent(text: x, ratio: 0.025))
            .toList(),
        Image.asset(
          "assets/images/appst/appst_4.png",
          width: baseWidth * 0.6,
          fit: BoxFit.cover,
        ),
        SizedBox(height: baseWidth * 0.01),
      ],
    );
  }
}
