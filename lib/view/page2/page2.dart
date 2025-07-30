import 'package:flutter/material.dart';
import 'package:my_page/common/text/blue_screen_text/blue_screen_text.dart';
import 'package:my_page/common/text/style/text_style.dart';
import 'package:my_page/component/windows_xp_box_component.dart';
import 'package:my_page/view/page2/sector/app/app_portfolio.dart';
import 'package:my_page/view/page2/sector/my_study/my_sytudy.dart';
import 'package:my_page/view/page2/sector/web/web_portfolio.dart';
import 'package:my_page/view/page2/sector/my_introduce/my_introduce.dart';
import 'package:my_page/view/page2/sector/skill_stack/skill_stack.dart';
import 'package:flutter/foundation.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = MediaQuery.of(context).size.width;
    if (!kIsWeb) {
      baseWidth = baseWidth * 0.8;
    }
    return Stack(
      children: [
        Text(
          blue_screen_text,
          style: Text_style.copyWith(color: Colors.white, fontSize: 30),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: baseWidth * 0.1),
            child: Container(
              width: kIsWeb ? baseWidth / 1.2 : double.infinity,

              child: WindowsExplorerComponent(
                child: Column(
                  children: [
                    title(),
                    const content(
                      childs: [
                        MyIntroduce(),
                        SkillStack(),
                        // CodingStyle(),
                        AppPortfolio(),
                        WebPortfolio(),
                        MySytudy(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class title extends StatelessWidget {
  const title({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0A246A), Color(0xFFA6CAF0)],
          ),
        ),
        child: Row(
          children: [
            SizedBox(width: 10),
            const Text(
              "저를 소개합니다!",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}

class content extends StatelessWidget {
  final List<Widget> childs;
  const content({super.key, required this.childs});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Color(0xFFF6F5F3), width: 2),
            right: BorderSide(color: Color(0xFFF6F5F3), width: 2),
            top: BorderSide(color: Color(0xFF485052), width: 2),
            left: BorderSide(color: Color(0xFF485052), width: 2),
          ),
        ),
        child: Column(children: childs),
      ),
    );
  }
}
