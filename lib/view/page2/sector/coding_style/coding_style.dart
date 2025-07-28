import 'package:flutter/material.dart';
import 'package:my_page/component/enter_text_component.dart';
import 'package:my_page/component/text_component.dart';

import '../../../../component/image_component.dart';
import '../../../../component/windows_xp_box_toggle_component.dart';

class CodingStyle extends StatelessWidget {
  const CodingStyle({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final message =
        "저의 코드는 극한의 단순함을 추구합니다.\n조금이라도 반복되는 코드는 컴포넌트화 시키며\n코드를 조금이라도 줄이기 위해 노력합니다.";
    return WindowsXpBoxToggleComponent(
      title: '코딩 스타일',
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: screenWidth * 0.05),
            TextComponent(text: "코드는 단순해야 한다.", ratio: 0.03),
            ImageComponent(path: "assets/images/hard_coding.png"),
            SizedBox(height: screenWidth * 0.03),
            EnterTextComponent(message: message),
          ],
        ),
      ),
    );
  }
}
