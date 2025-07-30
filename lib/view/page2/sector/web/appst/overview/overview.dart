import 'package:flutter/material.dart';
import 'package:my_page/component/enter_text_component.dart';

import '../../../../../../common/data/data.dart';
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
        const SizedBoxComponent(heightRatio: 0.05),
        Descriptor(),
      ],
    );
  }
}

class Descriptor extends StatelessWidget {
  const Descriptor({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const EnterTextComponent(
          sizedBoxWidthRatio: 0.62,
          message:
              "현재 구글 플레이 스토어에선 앱을 출시 하기 위해\n 2주간 12명의 테스터가 앱 테스트를 진행해야 합니다.\n 이를 위한 네이버 카페가 존재하며 사용자는\n 서로의 앱을 다운로드하고 인증하여 서로 돕는\n 구조로 되어 있습니다. 설치 과정이 복잡하며 설치 인증도\n 번거롭다는 단점이 존재합니다.",
        ),
        const SizedBoxComponent(heightRatio: 0.05),
        const TextComponent(text: "테스트 과정", ratio: 0.03),
        Image.asset(
          "assets/images/appst/appst_1.webp",
          width: baseWidth * 0.70,
        ),
        const SizedBoxComponent(heightRatio: 0.1),
        const TextComponent(text: "번거로운 인증 과정", ratio: 0.03),
        const BorderPictureComponent(
          width: baseWidth * 0.50,
          path: "assets/images/appst/appst_2.webp",
        ),
        SizedBoxComponent(heightRatio: 0.08),
        const EnterTextComponent(
          message:
              "이를 해결하기 위해 appst라는 커뮤니티를 만들기로 했습니다.\nGoogle groups라는 기능을 이용하면 그룹에 가입된 이메일은\n 비공개 테스트를 이용 할 수 있는 기능을 활용하여\n 테스터와 개발자의 빠른 테스트가 가능하게 해줍니다.",
        ),
        const SizedBoxComponent(heightRatio: 0.04),
        const TextComponent(text: "appst로 진행하는 인증과정", ratio: 0.03),
        Image.asset(
          "assets/images/appst/appst_3.webp",
          width: baseWidth * 0.70,
        ),
        const SizedBoxComponent(heightRatio: 0.03),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextComponent(text: "1. 작성자는 구글 그룹과 게시물을 작성합니다."),
            const TextComponent(text: "2. 테스터는 구글 그룹에 가입하며 앱을 설치하여 인증합니다."),
            const TextComponent(text: "3. 작성자는 인증을 확인하여 승인합니다."),
          ],
        ),
        const SizedBoxComponent(heightRatio: 0.03),
        const TextComponent(text: "사용자와 테스터는 서로 대화할 필요가 없습니다."),
        const TextComponent(text: "(설치와 인증 과정, 인증 확인이 매우 빠릅니다.)"),
        const SizedBoxComponent(heightRatio: 0.06),
        Image.asset(
          "assets/images/appst/appst_4.webp",
          width: baseWidth * 0.70,
        ),
        const SizedBoxComponent(heightRatio: 0.03),
        const EnterTextComponent(
          message:
              "appst는 서로 돕는 공간이기 때문에 자신의 앱을\n 설치한 횟수와 타인의 앱을 설치한 횟수를 비율로\n 계산한 점수 시스템을 도입할 예정입니다.",
        ),
        const SizedBoxComponent(heightRatio: 0.03),
      ],
    );
  }
}
