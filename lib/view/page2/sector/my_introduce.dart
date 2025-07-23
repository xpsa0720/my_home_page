import 'package:flutter/material.dart';

import '../../../common/text/style/text_style.dart';
import '../../../component/windows_xp_box_toggle_component.dart';

class MyIntroduce extends StatefulWidget {
  const MyIntroduce({super.key});

  @override
  State<MyIntroduce> createState() => _MyIntroduceState();
}

class _MyIntroduceState extends State<MyIntroduce> {
  late ScrollController controller;
  final double picture_width = 180;
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
    return Container(
      child: WindowsXpBoxToggleComponent(
        title: '누구신가요?',
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                MyPicture(),
                SizedBox(width: 10),

                Explanation(picture_width: picture_width),
              ],
            ),
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
      width: screenWidth * 0.7 - picture_width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '이름: 엄용진',
            style: Text_style.copyWith(fontSize: screenWidth * 0.025),
          ),
          Text(
            '''저는 단순한 기능 구현을 넘어, 비용, 안정성, 보안 등을 함께 고려하는 개발을 추구합니다. Flutter를 가장 능숙하게 다루며, 기술적 문제에 부딪혀도 현실과 타협하기보다는 인내심을 가지고 매일 밤을 새워가며 해결해 나갑니다.''',
            style: Text_style.copyWith(fontSize: screenWidth * 0.015),
          ),
          SizedBox(height: 20),
          Text(
            '#xpsa #보안 #주니어 개발자',
            style: Text_style.copyWith(fontSize: screenWidth * 0.013),
          ),
          SizedBox(height: 5),
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
