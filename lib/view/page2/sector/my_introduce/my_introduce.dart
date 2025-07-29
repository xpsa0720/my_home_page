import 'package:flutter/material.dart';

import '../../../../common/text/style/text_style.dart';
import '../../../../component/text_component.dart';
import '../../../../component/windows_xp_box_toggle_component.dart';

class MyIntroduce extends StatefulWidget {
  const MyIntroduce({super.key});

  @override
  State<MyIntroduce> createState() => _MyIntroduceState();
}

class _MyIntroduceState extends State<MyIntroduce> {
  late ScrollController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: WindowsXpBoxToggleComponent(
        title: '누구신가요?',
        child: Column(
          children: [
            SizedBox(height: screenWidth * 0.02),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                MyPicture(),
                SizedBox(width: screenWidth * 0.02),
                Explanation(picture_width: screenWidth * 0.2),
              ],
            ),

            SizedBox(height: screenWidth * 0.02),
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
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.55,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextComponent(text: '이름: 엄용진'),
          TextComponent(
            text:
                '''기술적 문제에 부딪혀도 현실과 타협하기보다는 인내심을 가지고 매일 밤을 새워가며 문제를 해결해 나갑니다.''',
            ratio: 0.02,
          ),
          SizedBox(height: screenWidth * 0.02),
          SelectableText(
            'Github: https://github.com/xpsa0720',
            style: Text_style.copyWith(fontSize: screenWidth * 0.02),
          ),
          SelectableText(
            'Blog(Security): https://noobhack.tistory.com/',
            style: Text_style.copyWith(fontSize: screenWidth * 0.02),
          ),
          SizedBox(height: screenWidth * 0.02),
          TextComponent(text: '#xpsa #보안 #주니어 개발자', ratio: 0.015),
          SizedBox(height: screenWidth * 0.01),
        ],
      ),
    );
  }
}

class MyPicture extends StatelessWidget {
  const MyPicture({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Image.asset(
          "assets/images/my_picture.jpg",
          width: screenWidth * 0.15,
        ),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
        ),
      ),
    );
  }
}
