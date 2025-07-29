import 'package:flutter/material.dart';
import 'package:my_page/component/image_component.dart';
import 'package:my_page/component/sized_box_text_component.dart';
import 'package:my_page/component/text_component.dart';

import '../../../../../common/model/skils_model.dart';
import '../../../../../common/text/style/text_style.dart';
import '../../../../../component/app_portfolio_component.dart';

class ScreenOnFlutter extends StatelessWidget {
  ScreenOnFlutter({super.key});

  final model = Skils_Model(
    Framwork: ["Flutter"],
    Language: ["Dart", "Kotlin"],
    title: "Screen On Flutter",
    package: [],
    descriptor:
        "Flutter을 위한 락 스크린 패키지입니다.\n락 스크린은 kotlin으로 구현해야 하지만\n플러터 액티비티와 플러터 엔진을 사용하여\nFlutter 위젯을 보여줍니다",

    Language_skil: [],
    gif_path: "assets/images/screen_on_flutter/screen_on_flutter_test.jpg",
    isRight: false,
    platform: ['Android'],
    personnel: 1,
  );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        AppPortfolioComponent(model: model),
        SizedBox(height: screenWidth * 0.04),
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
        TextComponent(text: "사용 예시", ratio: 0.025),
        ImageComponent(
          path: "assets/images/screen_on_flutter/screen_on_flutter_4.png",
          widthRatio: 0.6,
        ),
        SizedBox(height: screenWidth * 0.02),
        SizedBoxTextComponent(
          text:
              '플러터 엔진을 생성하여 서비스와 리시버를 등록하여 생성한 플러터 엔진을 사용하여 플러터 액티비티를 보여주는 방식입니다.',
          widthRatio: 0.66,
        ),
        SizedBox(height: screenWidth * 0.03),
        TextComponent(text: "구조", ratio: 0.025),
        ImageComponent(
          path: "assets/images/screen_on_flutter/screen_on_flutter_5.png",
          widthRatio: 0.7,
        ),
        SizedBox(height: screenWidth * 0.05),
        MethodChannelRequest(),
        SizedBox(height: screenWidth * 0.05),
        ScreenOnRegister(),
        SizedBox(height: screenWidth * 0.05),
        CreateFlutterEngine(),
        SizedBox(height: screenWidth * 0.05),
        TextComponent(text: "고도화 방향", ratio: 0.025),
        SizedBox(height: screenWidth * 0.01),
        SizedBoxTextComponent(
          text:
              "해당 플러그인의 치명적인 단점은 각 엔진이 상태 데이터(Provider)를 공유하지 못합니다. 상태 관리에 불리하기 때문에 하나의 플러터 엔진으로 락 스크린을 띄우는 고도화 작업을 진행할 예정입니다.",
          widthRatio: 0.6,
        ),
        SizedBox(height: screenWidth * 0.05),
        TextComponent(text: "개선된 구조", ratio: 0.025),
        ImageComponent(
          path: "assets/images/screen_on_flutter/screen_on_flutter_8.png",
        ),
        SizedBox(height: screenWidth * 0.02),
        SizedBoxTextComponent(
          text:
              "개선된 구조는 패키지에 method channel Listener 기능을 넣어 사용자가 화면을 키게 되면 플러터에게 신호를 보내어 플러터 Router에서 LockScreen으로 라우팅하는 방향으로 개선할 예정입니다.",
          widthRatio: 0.6,
        ),
        SizedBox(height: screenWidth * 0.02),
      ],
    );
  }
}

class CreateFlutterEngine extends StatelessWidget {
  const CreateFlutterEngine({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Text(
          'Create Flutter Engine',
          style: Text_style.copyWith(fontSize: screenWidth * 0.025),
        ),
        SizedBox(height: screenWidth * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black),
              ),
              child: Image.asset(
                "assets/images/screen_on_flutter/create_flutter_engine.png",
                width: screenWidth * 0.2,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: screenWidth * 0.01),

            Image.asset(
              "assets/images/screen_on_flutter/screen_on_flutter_1.png",
              width: screenWidth * 0.5,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ],
    );
  }
}

class ScreenOnRegister extends StatelessWidget {
  const ScreenOnRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Text(
          'Screen On Register Receciver',
          style: Text_style.copyWith(fontSize: screenWidth * 0.025),
        ),
        SizedBox(height: screenWidth * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black),
              ),
              child: Image.asset(
                "assets/images/screen_on_flutter/screen_on_registerReceiver.png",
                width: screenWidth * 0.2,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: screenWidth * 0.01),

            Image.asset(
              "assets/images/screen_on_flutter/screen_on_flutter_7.png",
              width: screenWidth * 0.5,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ],
    );
  }
}

class MethodChannelRequest extends StatelessWidget {
  const MethodChannelRequest({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Text(
          'Method Channel Request',
          style: Text_style.copyWith(fontSize: screenWidth * 0.025),
        ),
        SizedBox(height: screenWidth * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black),
              ),
              child: Image.asset(
                "assets/images/screen_on_flutter/screen_on_flutter_6.png",
                width: screenWidth * 0.2,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: screenWidth * 0.01),

            Image.asset(
              "assets/images/screen_on_flutter/start_service.png",
              width: screenWidth * 0.5,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ],
    );
  }
}
