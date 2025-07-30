import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_page/view/page1/window_screen/windows_xp_screen.dart';
import '../view/page2/page2.dart';

class Home extends StatelessWidget {
  static String get routeFullPath => '/';
  static String get routePath => '';
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4673E3),
      body: ListView(
        children: [
          const WindowsXpScreen(),
          const Page2(),
          Container(height: 1000),
        ],
      ),
    );
  }
}
