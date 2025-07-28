import 'package:my_page/component/windows_xp_box_toggle_component.dart';

import '../../../../common/text/style/text_style.dart';
import 'package:flutter/material.dart';

class SkillStack extends StatefulWidget {
  const SkillStack({super.key});

  @override
  State<SkillStack> createState() => _SkillStackState();
}

class _SkillStackState extends State<SkillStack> {
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
    final List<List<List<String>>> skil_list = [
      [
        ["C Language", "assets/images/pixel/C_Pixel.png"],
        ["Flutter", "assets/images/pixel/flutter_pixel.png"],
        ["Python", "assets/images/pixel/python_pixel.png"],
      ],
      [
        ["JavaScript", "assets/images/pixel/pxArt.png"],
        ["TypeScript", "assets/images/pixel/typeScript_pixel.png"],
        ["NestJs", "assets/images/pixel/nestJs_Pixel.png"],
      ],
      [
        ["Premiere pro", "assets/images/pixel/Pr_pixel.png"],
        ["After effects", "assets/images/pixel/Ae_pixel.png"],
      ],
    ];

    final screenWidth = MediaQuery.of(context).size.width;
    return WindowsXpBoxToggleComponent(
      title: '어떤 기술을 가졌나요?',
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "언어 및 프레임워크",
                style: Text_style.copyWith(fontSize: screenWidth * 0.025),
              ),
              for (int row = 0; row < skil_list.length; row++) ...[
                SizedBox(height: screenWidth * 0.02),
                Row(
                  mainAxisSize: MainAxisSize.min, //
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < skil_list[row].length; i++) ...[
                      PixelImage(
                        pic: skil_list[row][i][1],
                        name: skil_list[row][i][0],
                      ),
                      if (i != skil_list[row].length - 1) SizedBox(width: 40),
                    ],
                  ],
                ),
                SizedBox(height: 40),
              ],
              SizedBox(height: 40),
              DataBase(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  PixelImage({required String pic, required String name}) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(pic, width: screenWidth * 0.05),

          SizedBox(width: screenWidth * 0.01),
          Text(name, style: Text_style.copyWith(fontSize: screenWidth * 0.03)),
        ],
      ),
    );
  }
}

class DataBase extends StatelessWidget {
  const DataBase({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Text(
          "Database",
          style: Text_style.copyWith(fontSize: screenWidth * 0.03),
        ),
        SizedBox(height: screenWidth * 0.02),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/postgresql.png",
              width: screenWidth * 0.25,
            ),
            SizedBox(width: screenWidth * 0.05),
            Image.asset("assets/images/sqlite.webp", width: screenWidth * 0.25),
          ],
        ),
      ],
    );
  }
}
