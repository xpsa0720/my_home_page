import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:intl/intl.dart';

class Taskbar extends StatefulWidget {
  final double tabHeight;

  const Taskbar({super.key, required this.tabHeight});

  @override
  State<Taskbar> createState() => _TaskbarState();
}

class _TaskbarState extends State<Taskbar> {
  late Timer _timer;
  late String _timeString;
  final double WindowButtonWidth = 100;
  final double TimeWidgetWidth = 190;

  @override
  void initState() {
    super.initState();
    _timeString = _getCurrentTime();

    // 매 1초마다 _updateTime 실행
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _updateTime());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [tabBar()],
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // 꼭 타이머 정리!
    super.dispose();
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    return DateFormat('HH:mm').format(now); // 24시간 형식
  }

  void _updateTime() {
    setState(() {
      _timeString = _getCurrentTime();
    });
  }

  tabBar() {
    return InnerShadow(
      shadows: [
        Shadow(color: Colors.white, blurRadius: 8, offset: Offset(0, 2)),
        Shadow(color: Colors.black, blurRadius: 8, offset: Offset(0, -2)),
      ],
      child: Container(
        height: widget.tabHeight,
        width: double.infinity,
        child: Stack(
          children: [
            Row(children: [windowButton()]),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("A", style: TextStyle(fontSize: 25, color: Colors.white)),
                SizedBox(width: 5),
                TimeWidget(),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3A85F1), Color(0xFF1F5AD5)],
          ),
        ),
      ),
    );
  }

  TimeWidget() {
    return InnerShadow(
      shadows: [
        Shadow(color: Colors.black, blurRadius: 5, offset: Offset(0, 0)),
      ],
      child: Container(
        width: 150,
        height: widget.tabHeight,
        decoration: BoxDecoration(color: Color(0xFF149AEB)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset("assets/images/computer.png", width: 20),
            SizedBox(width: 3),
            Image.asset("assets/images/error.png", width: 20),
            SizedBox(width: 2),
            Image.asset("assets/images/sound.png", width: 20),
            SizedBox(width: 10),
            BoderText(text: _timeString),
            SizedBox(width: 15),
          ],
        ),
      ),
    );
  }

  windowButton() {
    return InnerShadow(
      shadows: [
        Shadow(color: Colors.black, blurRadius: 5, offset: Offset(0, 0)),
      ],
      child: Container(
        width: WindowButtonWidth,
        height: widget.tabHeight,
        decoration: BoxDecoration(
          color: Color(0xFF48A846),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Row(
          children: [
            SizedBox(width: 10),
            SizedBox(
              width: 25,
              height: 25,
              child: Image.asset(
                "assets/images/window_xp_logo.png",
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(width: 8),
            BoderText(text: "시작"),
          ],
        ),
      ),
    );
  }

  BoderText({required String text}) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            fontFamily: 'neo',
            fontSize: 18,
            // color: Colors.white,
            foreground:
                Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 1.1
                  ..color = Colors.black,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontFamily: 'neo',
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
