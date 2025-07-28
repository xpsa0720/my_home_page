import 'package:flutter/material.dart';
import 'package:my_page/component/text_component.dart';

import '../../../../../../common/model/skils_model.dart';
import '../../../../../../common/text/style/text_style.dart';
import '../../../../../../component/border_picture.dart';

class Backend extends StatelessWidget {
  final Skils_Model model;
  const Backend({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: screenWidth * 0.02),
              // Design(),
              // SizedBox(height: screenWidth * 0.04),
              Current(),
              SizedBox(height: screenWidth * 0.1),
              Architecture(),
              SizedBox(height: screenWidth * 0.02),
            ],
          ),
        ),
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
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Text(
          "아키텍쳐 개요",
          style: Text_style.copyWith(fontSize: screenWidth * 0.03),
        ),
        SizedBox(height: screenWidth * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: screenWidth * 0.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    title
                        .map(
                          (x) => Text(
                            x + ":",
                            style: Text_style.copyWith(
                              fontSize: screenWidth * 0.025,
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
            SizedBox(
              width: screenWidth * 0.25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    content
                        .map(
                          (x) => Text(
                            x,
                            style: Text_style.copyWith(
                              fontSize: screenWidth * 0.025,
                            ),
                          ),
                        )
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
    final screenWidth = MediaQuery.of(context).size.width;
    final message = "Mutual Install System 구현(개요 참고)";
    final success_task = [
      "로그인 기능",
      "회원 가입 기능",
      "회원 가입 이메일 인증",
      "설치 인증 요청",
      "설치 인증 확인",
      "게시물 업로드",
      "게시물 삭제",
    ];
    return Column(
      children: [
        TextComponent(ratio: 0.025, text: "현재 완료한 작업"),
        SizedBox(height: screenWidth * 0.01),
        ...success_task.map((x) => TextComponent(text: x)).toList(),
        SizedBox(height: screenWidth * 0.1),
        TextComponent(ratio: 0.025, text: "현재 진행중인 작업"),
        SizedBox(height: screenWidth * 0.02),
        ...message
            .split("\n")
            .map((x) => TextComponent(text: x, ratio: 0.02))
            .toList(),
        Image.asset(
          "assets/images/appst/appst_4.png",
          width: screenWidth * 0.6,
          fit: BoxFit.cover,
        ),
        SizedBox(height: screenWidth * 0.01),
      ],
    );
  }
}
