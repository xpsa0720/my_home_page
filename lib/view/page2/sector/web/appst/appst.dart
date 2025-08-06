import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../../../common/model/skils_model.dart';
import '../../../../../component/windows_xp_box_toggle_component.dart';
import 'backend/backend.dart';
import 'frontend/frontend.dart';
import 'overview/overview.dart';

class Appst extends StatelessWidget {
  const Appst({super.key});
  static const model = Skils_Model(
    Framwork: ["Flutter", "NestJs"],
    Language: ["Dart", "TypeScript"],
    package: [],
    git_link: [
      "https://github.com/xpsa0720/appst_frontend",
      "https://github.com/xpsa0720/appst_backend",
    ],
    title: "APPST - 앱 개발자 커뮤니티",
    descriptor: "플레이 스토어 앱 개발자를 위한 커뮤니티입니다.\n비공개 테스트를 쉽게 하기 위해 만든 웹 서비스입니다.",
    Language_skil: [],
    gif_path: "assets/images/appst/appst_6.png",

    isMaking: true,
    isRight: true,
    platform: ['Web', 'Android'],
    personnel: 1,
  );
  @override
  Widget build(BuildContext context) {
    const List<String> Title_list = ['개요', '프론트엔드(Flutter)', "백엔드(NestJs)"];
    const List<Widget> Portfolio_page = [
      Overview(model: model),
      FrontEnd(model: model),
      Backend(model: model),
    ];
    return Column(
      children:
          Portfolio_page.expandIndexed<Widget>(
            (i, x) => [
              WindowsXpBoxToggleComponent(title: Title_list[i], child: x),
            ],
          ).toList(),
    );
  }
}
