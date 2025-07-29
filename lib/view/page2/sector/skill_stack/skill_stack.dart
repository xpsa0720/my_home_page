import 'package:collection/collection.dart';
import 'package:my_page/component/image_component.dart';
import 'package:my_page/component/text_component.dart';
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
              SizedBox(height: screenWidth * 0.06),
              Framework(),
              SizedBox(height: screenWidth * 0.06),
              DataBase(),
              SizedBox(height: screenWidth * 0.06),
              Tools(),
              SizedBox(height: screenWidth * 0.06),
              Collaboration(),
              SizedBox(height: screenWidth * 0.06),
            ],
          ),
        ),
      ),
    );
  }
}

class Framework extends StatefulWidget {
  const Framework({super.key});

  @override
  State<Framework> createState() => _FrameworkState();
}

class _FrameworkState extends State<Framework> {
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
    ];
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Text(
          "Language & Framework",
          style: Text_style.copyWith(fontSize: screenWidth * 0.025),
        ),
        SizedBox(height: screenWidth * 0.03),
        for (int row = 0; row < skil_list.length; row++) ...[
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
          SizedBox(height: screenWidth * 0.06),
        ],
      ],
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
    final List<String> database_list = [
      "assets/images/database/postgresql.png",
      "assets/images/database/sqlite.webp",
    ];
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Text(
          "Database",
          style: Text_style.copyWith(fontSize: screenWidth * 0.03),
        ),
        SizedBox(height: screenWidth * 0.01),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              database_list
                  .expandIndexed<Widget>(
                    (i, x) => [
                      ImageComponent(path: x, widthRatio: 0.2),
                      if (i != database_list.length - 1)
                        SizedBox(width: screenWidth * 0.04),
                    ],
                  )
                  .toList(),
        ),
      ],
    );
  }
}

class Tools extends StatelessWidget {
  const Tools({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tools_list = [
      "assets/images/tools/android_studio.png",
      "assets/images/tools/vs.webp",
      "assets/images/tools/vscode.jpg",
      "assets/images/tools/postman.png",
    ];
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        TextComponent(text: "Tools", ratio: 0.03),
        SizedBox(height: screenWidth * 0.02),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              tools_list
                  .expandIndexed<Widget>(
                    (i, x) => [
                      ImageComponent(path: x, widthRatio: 0.08),
                      if (i != tools_list.length - 1)
                        SizedBox(width: screenWidth * 0.04),
                    ],
                  )
                  .toList(),
        ),
        SizedBox(height: screenWidth * 0.08),
      ],
    );
  }
}

class Collaboration extends StatelessWidget {
  const Collaboration({super.key});

  @override
  Widget build(BuildContext context) {
    final List<List<String>> collaboration_list = [
      [
        "assets/images/collaboration/git.png",
        "assets/images/collaboration/notion.png",
        "assets/images/collaboration/figma.png",
        "assets/images/collaboration/slack.png",
      ],
      [
        "assets/images/collaboration/ppt.png",
        "assets/images/collaboration/excel.jpg",
        "assets/images/collaboration/pr.png",
        "assets/images/collaboration/ae.png",
      ],
    ];
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        TextComponent(text: "Collaboration & Design & Document", ratio: 0.03),
        SizedBox(height: screenWidth * 0.02),

        ...collaboration_list
            .expandIndexed<Widget>(
              (i, x) => [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      x
                          .expandIndexed(
                            (j, y) => [
                              ImageComponent(path: y, widthRatio: 0.08),
                              if (j != collaboration_list[i].length - 1)
                                SizedBox(width: screenWidth * 0.04),
                            ],
                          )
                          .toList(),
                ),
              ],
            )
            .toList(),

        SizedBox(height: screenWidth * 0.08),
      ],
    );
  }
}
