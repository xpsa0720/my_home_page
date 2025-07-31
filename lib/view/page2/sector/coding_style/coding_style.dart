import 'package:flutter/material.dart';
import 'package:my_page/component/enter_text_component.dart';
import 'package:my_page/component/text_component.dart';

import '../../../../common/data/data.dart';
import '../../../../component/image_component.dart';
import '../../../../component/windows_xp_box_toggle_component.dart';

class CodingStyle extends StatelessWidget {
  const CodingStyle({super.key});

  @override
  Widget build(BuildContext context) {
    final message1 =
        "저의 코드는 극한의 단순함을 추구합니다.\n조금이라도 반복되는 코드는 컴포넌트화 시키며\n코드를 조금이라도 줄이기 위해 노력합니다.";
    final message2 =
        "컴포넌트를 많이 만들어두면 장기적인 개발에 유리합니다.\n유지보수에도 유리하며 블럭을 조립하듯이\n코드를 작성할 수 있습니다.";
    return WindowsXpBoxToggleComponent(
      title: '코딩 스타일',
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: ScreenWidth(context) * 0.05),
            const TextComponent(text: "코드는 단순해야 한다.", ratio: 0.03),
            const ImageComponent(path: "assets/images/hard_coding.png"),
            SizedBox(height: ScreenWidth(context) * 0.03),
            EnterTextComponent(message: message1),
            SizedBox(height: ScreenWidth(context) * 0.08),
            const TextComponent(text: "반복되는 패턴은 컴포넌트화", ratio: 0.03),
            SizedBox(height: ScreenWidth(context) * 0.01),
            const ImageComponent(
              path: "assets/images/component.png",
              widthRatio: 0.5,
            ),
            SizedBox(height: ScreenWidth(context) * 0.02),
            EnterTextComponent(message: message2),
            SizedBox(height: ScreenWidth(context) * 0.04),
          ],
        ),
      ),
    );
  }
}
