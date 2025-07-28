import 'package:flutter/material.dart';
import 'package:my_page/component/border_picture.dart';
import 'package:my_page/component/text_component.dart';

import '../../../../../../common/model/skils_model.dart';
import '../../../../../../common/text/style/text_style.dart';
import '../../../../../../component/enter_text_component.dart';

class FrontEnd extends StatelessWidget {
  final Skils_Model model;
  const FrontEnd({super.key, required this.model});

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
              SizedBox(height: screenWidth * 0.05),
              SecurityIssue(),
              SizedBox(height: screenWidth * 0.1),
              TextComponent(ratio: 0.025, text: "Riverpod 종속 관계 (구현 완료)"),
              Image.asset(
                "assets/images/appst/appst_5.png",
                width: screenWidth * 0.70,
              ),
              SizedBox(height: screenWidth * 0.02),
            ],
          ),
        ),
      ],
    );
  }
}

class SecurityIssue extends StatelessWidget {
  const SecurityIssue({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final message =
        "보안을 전공했던 만큼 패키지 정보를 꼼꼼하게 확인했습니다.\n현재 flutter_secure_storage 패키지는 HTTPS, localhost에서만 정상 작동하기 때문에 배포시, HSTS(HTTP Strict Transport Security)을 적용할 예정입니다.";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "flutter_secure_storage Web 보안 이슈",
          style: Text_style.copyWith(fontSize: screenWidth * 0.025),
        ),
        SizedBox(height: screenWidth * 0.01),
        Image.asset(
          "assets/images/appst/appst_7.png",
          width: screenWidth * 0.66,
        ),
        SizedBox(height: screenWidth * 0.01),
        EnterTextComponent(message: message, sizedBoxWidthRatio: 0.6),
      ],
    );
  }
}

class Current extends StatelessWidget {
  const Current({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final message =
        "UI 구성과 웹 디자인을 진행하고 있습니다.\n appst의 디자인 컨셉은 직관성과 단순함을\n 목표로 작업하고 있으며 버튼과 UI를\n 최소한으로 하여 사용자에게 부담을\n 줄이는 방향으로 디자인 중 입니다.";

    final success_task = ["API 연동", "로그인 초기 UI 제작", "홈 초기 UI 제작"];

    return Column(
      children: [
        Text(
          "현재 완료한 작업",
          style: Text_style.copyWith(fontSize: screenWidth * 0.025),
        ),
        SizedBox(height: screenWidth * 0.01),
        ...success_task.map((x) => TextComponent(text: x)).toList(),
        SizedBox(height: screenWidth * 0.1),
        TextComponent(text: "현재 진행중인 작업", ratio: 0.025),
        SizedBox(height: screenWidth * 0.02),
        EnterTextComponent(message: message),
        SizedBox(height: screenWidth * 0.01),
        BorderPictureComponent(
          width: screenWidth * 0.6,
          path: "assets/images/appst/appst_6.png",
        ),
        SizedBox(height: screenWidth * 0.1),
      ],
    );
  }
}

class Design extends StatelessWidget {
  const Design({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final message =
        "appst의 디자인 컨셉은 극한의 직관성과 단순함입니다.\n앱 배포를 처음 하시는 분들의 진입장벽을 최대한 낮추기 위해 \n버튼과 UI를 최소한으로 하여 사용자에게 부담을\n최대한 줄이도록 디자인하였습니다.";
    return Column(
      children: [
        Text(
          "디자인 철학",
          style: Text_style.copyWith(fontSize: screenWidth * 0.025),
        ),
        SizedBox(height: screenWidth * 0.02),

        // 수정 필요
        EnterTextComponent(message: message),
      ],
    );
  }
}
