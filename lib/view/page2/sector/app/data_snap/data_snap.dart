import 'package:flutter/material.dart';
import 'package:my_page/component/app_portfolio_component.dart';
import 'package:my_page/component/picture_list_component.dart';
import 'package:my_page/component/sized_box_text_component.dart';

import '../../../../../common/model/skils_model.dart';
import '../../../../../common/text/style/text_style.dart';

class DataSnap extends StatelessWidget {
  DataSnap({super.key});
  final model = Skils_Model(
    Framwork: ["Flutter"],
    Language: ["Dart"],
    package: [
      "flutter_downloader",
      "permission_handler",
      "file_picker",
      "image_picker",
      "image_gallery_saver",
      "http",
    ],
    title: "Date Snap - 라벨 삽입 앱",
    descriptor:
        "날짜와 라벨을 삽입하는 앱 입니다.\n라벨의 위치는 디스플레이의 가로 세로 비율을\n참고하여 유연하게 위치를 설정합니다.",

    Language_skil: [],
    gif_path: "assets/images/gif/date_snap_test.gif",
    isRight: true,
    platform: ['Android'],
    personnel: 1,
  );
  final screenshot_list = [
    [
      "assets/images/date_snap/date_snap_1.jpg",
      "assets/images/date_snap/date_snap_2.jpg",
    ],
    [
      "assets/images/date_snap/date_snap_3.jpg",
      "assets/images/date_snap/date_snap_4.jpg",
    ],
    [
      "assets/images/date_snap/date_snap_5.jpg",
      "assets/images/date_snap/date_snap_6.jpg",
    ],
  ];
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        AppPortfolioComponent(model: model),
        SizedBox(height: screenWidth * 0.04),
        PictureListComponent(
          list: screenshot_list,
          PictureWidth: screenWidth * 0.3,
          SizedBoxWidth: screenWidth * 0.02,
          SizedBoxHeight: screenWidth * 0.04,
        ),
        SizedBox(height: screenWidth * 0.02),
        Text(
          "라벨 데이터 저장 방식",
          style: Text_style.copyWith(fontSize: screenWidth * 0.025),
        ),
        Image.asset(
          "assets/images/date_snap/date_snap_7.png",
          width: screenWidth * 0.7,
          fit: BoxFit.cover,
        ),
        SizedBox(height: screenWidth * 0.03),
        SizedBoxTextComponent(
          text:
              "라벨 데이터는 shared_preferences를 사용하여 저장했으며, 화면 길이에 비례하는 비율 기반으로 저장했습니다. 라벨의 크기는 라벨이 화면에서 비중을 차지하는 비율을 저장했습니다.",
          widthRatio: 0.6,
        ),
        SizedBox(height: screenWidth * 0.03),
      ],
    );
  }
}
