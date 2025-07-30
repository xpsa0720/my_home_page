import 'package:flutter/material.dart';

import '../../../component/task_bar_component.dart';

class WindowsXpScreen extends StatefulWidget {
  const WindowsXpScreen({super.key});

  @override
  State<WindowsXpScreen> createState() => _WindowsXpScreenState();
}

class _WindowsXpScreenState extends State<WindowsXpScreen> {
  double sizeX = 0;

  double sizeY = 0;

  double posX = 0;

  double posY = 0;

  double prevbaseWidth = 0;

  double prevScreenHeight = 0;

  double taskBarHeight = 35;

  bool isDrag = false;

  bool isResizing = false;

  bool init = true;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final double baseWidth = MediaQuery.of(context).size.width;
    if (prevbaseWidth == 0) {
      prevbaseWidth = baseWidth;
      prevScreenHeight = screenHeight;
    }

    if (prevbaseWidth != baseWidth) {
      prevbaseWidth = baseWidth;
      prevScreenHeight = screenHeight;
      init = true;
    }

    if (init) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            sizeX = baseWidth / 1.5;
            sizeY = sizeX / 1.53;
            posX = (baseWidth / 2) - sizeX * 0.5;
            posY = (screenHeight / 2) - sizeY * 0.6;
            init = false;
          });
        }
      });
    }
    return Stack(
      children: [
        background(baseWidth, screenHeight),
        cmdPosition(baseWidth, screenHeight),
        MyText(baseWidth, screenHeight),
        cmd_BarPosition(baseWidth, screenHeight),

        Container(
          width: double.infinity,
          height: screenHeight,
          child: Taskbar(tabHeight: taskBarHeight),
        ),
      ],
    );
  }

  cmdPicture() {
    return Container(
      height: sizeY,
      child: Image.asset(
        "assets/images/windows_xp/cmd.webp",
        fit: BoxFit.fitWidth,
      ),
    );
  }

  cmdPosition(double baseWidth, double screenHeight) {
    return Positioned(
      left: posX,
      top: posY,
      child: Stack(
        children: [
          Container(
            width: sizeX,
            height: sizeY,
            child: Image.asset(
              "assets/images/windows_xp/cmd.webp",
              fit: BoxFit.fitWidth,
            ),
            color: Colors.blue,
          ),

          Positioned(
            top: 0,
            left: 0,
            child: GestureDetector(
              onPanUpdate: (details) {
                if (!mounted) return;
                setState(() {
                  final newX = posX + details.delta.dx;
                  final newY = posY + details.delta.dy;
                  if (newX >= 0 &&
                      newX <= baseWidth - sizeX &&
                      newY >= 0 &&
                      newY <= screenHeight - sizeY - taskBarHeight) {
                    posX = newX;
                    posY = newY;
                    isDrag = true;
                  }
                });
              },
              child: Container(
                width: sizeX,
                height: sizeY * 0.08, // ← 상단 제목줄 영역만큼만 드래그 가능
                color: Colors.transparent, // 마우스 드래그 감지용 (보이게 하고 싶으면 색 입혀도 됨)
              ),
            ),
          ),
        ],
      ),
    );
  }

  MyText(double baseWidth, double screenHeight) {
    return Positioned(
      left: posX + sizeX * 0.02,
      top: posY + sizeY * 0.1,

      child: Text(
        '''# 안녕하세요 보안을 이해하는 개발자 엄용진입니다.
        
> 컴퓨터 보안을 전공하며 보안 회사에 경험을 쌓으며
  현재는 개발로 방향을 바꾸게 되었습니다
       
        
> 저는 컴퓨터를 다루는 것에 큰 흥미가 있습니다.
  단순히 기능을 구현하는 것이 아닌 최적화, 보안, 비용, 가독성을
  고려한 개발을 추구합니다.
  
  
> 컨디션 관리를 통한 질 좋은 코드를 작성하기 
  위해 지속 가능한 노력을 추구합니다.
  
> 기술 스택: 
    Python, Flutter, JavaScript, TypeScript, nestJS, C, Asembly Language''',
        style: TextStyle(
          fontSize: sizeX * 0.024,
          color: Colors.white,
          fontFamily: "neo",
        ),
      ),
    );
  }

  cmd_BarPosition(double baseWidth, double screenHeight) {
    return Positioned(
      left: posX + sizeX - sizeX * 0.034,
      top: posY + sizeY - sizeY * 0.89,
      child: Stack(
        children: [
          Image.asset(
            width: sizeX * 0.025,
            "assets/images/windows_xp/cmd_bar.webp",
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }

  background(double baseWidth, double screenHeight) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        height: screenHeight,
        child: Image.asset(
          "assets/images/windows_xp/window_background.webp",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
