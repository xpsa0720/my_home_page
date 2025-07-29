import 'package:flutter/material.dart';
import 'package:my_page/component/sized_box_text_component.dart';

import '../../../../../../common/model/skils_model.dart';
import '../../../../../../component/border_picture.dart';
import '../../../../../../component/sized_box_component.dart';
import '../../../../../../component/text_component.dart';
import '../../../../../../component/web_portfolio_component.dart';

class Overview extends StatelessWidget {
  final Skils_Model model;
  const Overview({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WebPortfolioComponent(model: model),
        SizedBoxComponent(heightRatio: 0.05),
        Descriptor(),
      ],
    );
  }
}

class Descriptor extends StatelessWidget {
  const Descriptor({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBoxTextComponent(
          widthRatio: 0.62,
          text:
              "현재 구글 플레이 스토어에선 앱을 출시 하기 위해 2주간 12명의 테스터가 앱 테스트를 진행해야 합니다. 이를 위한 네이버 카페가 존재하며 사용자는 서로의 앱을 다운로드하고 인증하여 서로 돕는 구조로 되어 있습니다. 설치 과정이 복잡하며 설치 인증도 번거롭다는 단점이 존재합니다.",
        ),
        SizedBoxComponent(heightRatio: 0.05),
        TextComponent(text: "테스트 과정", ratio: 0.025),
        Image.asset(
          "assets/images/appst/appst_1.png",
          width: screenWidth * 0.70,
        ),
        SizedBoxComponent(heightRatio: 0.05),
        TextComponent(text: "번거로운 인증 과정", ratio: 0.025),
        BorderPictureComponent(
          width: screenWidth * 0.50,
          path: "assets/images/appst/appst_2.png",
        ),
        SizedBoxComponent(heightRatio: 0.03),
        SizedBoxTextComponent(
          widthRatio: 0.62,
          text:
              "현재 구글 플레이 스토어에선 앱을 출시 하기 위해 2주간 12명의 테스터가 앱 테스트를 진행해야 합니다. 이를 위한 네이버 카페가 존재하지만 설치 과정이 복잡하며 설치 인증도 번거롭다는 단점이 존재합니다.",
        ),
        SizedBoxComponent(heightRatio: 0.08),
        TextComponent(text: "appst로 진행하는 인증과정", ratio: 0.025),
        Image.asset(
          "assets/images/appst/appst_3.png",
          width: screenWidth * 0.70,
        ),
        SizedBoxComponent(heightRatio: 0.03),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextComponent(text: "1. 작성자는 구글 그룹과 게시물을 작성합니다."),
            TextComponent(text: "2. 테스터는 구글 그룹에 가입하며 앱을 설치하여 인증합니다."),
            TextComponent(text: "3. 작성자는 인증을 확인하여 승인합니다."),
          ],
        ),
        SizedBoxComponent(heightRatio: 0.03),
        TextComponent(text: "사용자와 테스터는 서로 대화할 필요가 없습니다."),
        TextComponent(text: "(설치와 인증 과정, 인증 확인이 매우 빠릅니다.)"),
        SizedBoxComponent(heightRatio: 0.06),
        Image.asset(
          "assets/images/appst/appst_4.png",
          width: screenWidth * 0.70,
        ),
        SizedBoxComponent(heightRatio: 0.03),
        SizedBoxTextComponent(
          widthRatio: 0.55,
          text:
              "appst는 서로 돕는 공간이기 때문에 자신의 앱을 설치한 횟수와 타인의 앱을 설치한 횟수를 비율로 계산한 점수 시스템을 도입할 예정입니다.",
        ),
        SizedBoxComponent(heightRatio: 0.03),
      ],
    );
  }
}
