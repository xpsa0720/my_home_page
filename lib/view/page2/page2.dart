import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_page/common/text/blue_screen_text/blue_screen_text.dart';
import 'package:my_page/common/text/style/text_style.dart';
import 'package:my_page/component/windows_xp_box_component.dart';
import 'package:my_page/view/page2/sector/app/app_portfolio.dart';
import 'package:my_page/view/page2/sector/coding_style/coding_style.dart';
import 'package:my_page/view/page2/sector/my_study/my_sytudy.dart';
import 'package:my_page/view/page2/sector/web/web_portfolio.dart';
import 'package:my_page/view/page2/sector/my_introduce/my_introduce.dart';
import 'package:my_page/view/page2/sector/skill_stack/skill_stack.dart';

import '../../component/windows_xp_box_toggle_component.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> with TickerProviderStateMixin {
  late ScrollController controller;
  final typing_speed = Duration(milliseconds: 100);
  String _displayedText = '';
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = ScrollController();
    _startTyping();
  }

  void _startTyping() {
    _timer = Timer.periodic(typing_speed, (timer) {
      if (_currentIndex < blue_screen_text.length) {
        setState(() {
          _displayedText += blue_screen_text[_currentIndex];
          _currentIndex++;
        });
      } else {
        _timer?.cancel();
      }
    });
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
    return Stack(
      children: [
        Text(
          _displayedText,
          style: Text_style.copyWith(color: Colors.white, fontSize: 30),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: screenWidth * 0.1),
            child: Container(
              width: screenWidth / 1.3,
              child: WindowsExplorerComponent(
                child: Column(
                  children: [
                    title(),
                    content(
                      childs: [
                        MyIntroduce(),
                        SkillStack(),
                        CodingStyle(),
                        AppPortfolio(),
                        WebPortfolio(),
                        MySytudy(),
                      ],
                      controller: controller,
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
            Text(
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
  final ScrollController controller;
  const content({super.key, required this.childs, required this.controller});

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
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          controller: controller,
          children: childs,
        ),
      ),
    );
  }
}
