import 'package:flutter/material.dart';

import '../../../../common/data/data.dart';
import '../../../../common/text/style/text_style.dart';
import '../../../../component/text_component.dart';
import '../../../../component/windows_xp_box_toggle_component.dart';

class MyIntroduce extends StatelessWidget {
  const MyIntroduce({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: WindowsXpBoxToggleComponent(
        title: '누구신가요?',
        child: Column(
          children: [
            SizedBox(height: baseWidth * 0.02),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: baseWidth * 0.06),
                MyPicture(),
                SizedBox(width: baseWidth * 0.02),
                Explanation(picture_width: baseWidth * 0.2),
              ],
            ),

            SizedBox(height: baseWidth * 0.02),
          ],
        ),
      ),
    );
  }
}

class Explanation extends StatelessWidget {
  final double picture_width;
  const Explanation({super.key, required this.picture_width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: baseWidth * 0.55,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const TextComponent(text: '이름: 엄용진'),
          const TextComponent(
            text:
                '''기술적 문제에 부딪혀도 현실과 타협하기보다는 인내심을 가지고 매일 밤을 새워가며 문제를 해결해 나갑니다.''',
            ratio: 0.02,
          ),
          SizedBox(height: baseWidth * 0.02),
          SelectableText(
            'Github: https://github.com/xpsa0720',
            style: Text_style.copyWith(fontSize: baseWidth * 0.02),
          ),
          SelectableText(
            'Blog(Security): https://noobhack.tistory.com/',
            style: Text_style.copyWith(fontSize: baseWidth * 0.02),
          ),
          SizedBox(height: baseWidth * 0.02),
          const TextComponent(text: '#xpsa #보안 #주니어 개발자', ratio: 0.015),
          SizedBox(height: baseWidth * 0.01),
        ],
      ),
    );
  }
}

class MyPicture extends StatelessWidget {
  const MyPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Image.asset(
          "assets/images/my_picture.webp",
          width: baseWidth * 0.15,
        ),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
        ),
      ),
    );
  }
}
