import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_page/common/text/style/text_style.dart';
import 'package:my_page/common/util/dat_util.dart';
import 'package:my_page/component/link_text_component.dart';
import 'package:my_page/component/sized_box_text_component.dart';

import '../common/model/skils_model.dart';

class AppPortfolioComponent extends StatefulWidget {
  final Skils_Model model;
  const AppPortfolioComponent({super.key, required this.model});

  @override
  State<AppPortfolioComponent> createState() => _AppPortfolioComponentState();
}

class _AppPortfolioComponentState extends State<AppPortfolioComponent> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.015),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(height: screenWidth * 0.01),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      widget.model.isRight
                          ? [
                            Image_GIF(model: widget.model),
                            SizedBox(width: screenWidth * 0.03),
                            Descriptor(
                              model: widget.model,
                              fontSize: screenWidth * 0.025,
                            ),
                          ]
                          : [
                            Descriptor(
                              model: widget.model,
                              fontSize: screenWidth * 0.025,
                            ),
                            // SizedBox(width: screenWidth * 0.03),
                            Image_GIF(model: widget.model),
                          ],
                ),
                SizedBox(height: screenWidth * 0.03),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...widget.model.descriptor
                        .split("\n")
                        .map(
                          (x) => Text(
                            x,
                            style: Text_style.copyWith(
                              fontSize: screenWidth * 0.020,
                            ),
                          ),
                        ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  final Skils_Model model;
  const Title({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Text(
          model.title,
          style: Text_style.copyWith(fontSize: screenWidth * 0.020),
        ),
      ],
    );
  }
}

class Image_GIF extends StatelessWidget {
  final Skils_Model model;
  const Image_GIF({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Title(model: model),
        SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.black),
          ),
          child: Image.asset(model.gif_path, width: screenWidth / 4),
        ),
      ],
    );
  }
}

class Descriptor extends StatelessWidget {
  final Skils_Model model;
  final double fontSize;
  const Descriptor({super.key, required this.model, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(children: []),
          SizedBox(height: screenWidth * 0.04),
          Language(fontSize: fontSize, model: model),
          SizedBox(height: screenWidth * 0.02),
          Framwork(fontSize: fontSize, model: model),
          SizedBox(height: screenWidth * 0.02),
          // Library(model: model, fontSize: fontSize),
          // SizedBox(height: screenWidth * 0.02),
          Platform(model: model, fontSize: fontSize),
          SizedBox(height: screenWidth * 0.02),
          Personnel(model: model, fontSize: fontSize),
          SizedBox(height: screenWidth * 0.02),
          if (model.git_link != null) GitLink(model: model),
          SizedBox(height: screenWidth * 0.03),
          if (model.package.isNotEmpty) Package(model: model),
        ],
      ),
    );
  }
}

class GitLink extends StatelessWidget {
  final Skils_Model model;
  const GitLink({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBoxTextComponent(text: "깃허브: ", ratio: 0.025, widthRatio: 0.17),
        LinkTextComponent(text: "링크", link: model.git_link!, ratio: 0.025),
      ],
    );
  }
}

class Package extends StatelessWidget {
  final Skils_Model model;
  const Package({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "패키지:",
              style: Text_style.copyWith(fontSize: screenWidth * 0.025),
            ),
            SizedBox(height: screenWidth * 0.01),
            ...model.package
                .expandIndexed(
                  (i, x) => [
                    Row(
                      children: [
                        SizedBox(width: screenWidth * 0.04),
                        Text(
                          x,
                          style: Text_style.copyWith(
                            fontSize: screenWidth * 0.025,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
                .toList(),
          ],
        ),
      ],
    );
  }
}

class Personnel extends StatelessWidget {
  final Skils_Model model;
  final double fontSize;
  const Personnel({super.key, required this.model, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(
          width: screenWidth * 0.17,
          child: Text(
            "개발 인원: ",
            style: Text_style.copyWith(fontSize: fontSize),
          ),
        ),

        Text(
          model.personnel.toString() +
              "명" +
              (model.personnel == 1 ? " (개인)" : ""),
          style: Text_style.copyWith(fontSize: fontSize),
        ),
      ],
    );
  }
}

class Platform extends StatelessWidget {
  final Skils_Model model;
  final double fontSize;
  const Platform({super.key, required this.model, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(
          width: screenWidth * 0.17,
          child: Text("플랫폼: ", style: Text_style.copyWith(fontSize: fontSize)),
        ),

        Row(
          children:
              model.platform
                  .map(
                    (x) =>
                        Text(x, style: Text_style.copyWith(fontSize: fontSize)),
                  )
                  .toList(),
        ),
      ],
    );
  }
}

class Library extends StatelessWidget {
  final Skils_Model model;
  final double fontSize;
  const Library({super.key, required this.model, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(
          width: screenWidth * 0.17,
          child: Text(
            "라이브러리: ",
            style: Text_style.copyWith(fontSize: fontSize),
          ),
        ),

        Row(
          children:
              model.Language_skil.expand(
                (x) => [
                  Text(x, style: Text_style.copyWith(fontSize: fontSize)),
                  SizedBox(width: screenWidth * 0.02),
                ],
              ).toList(),
        ),
      ],
    );
  }
}

class Framwork extends StatelessWidget {
  final Skils_Model model;
  final double fontSize;
  const Framwork({super.key, required this.model, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(
          width: screenWidth * 0.17,
          child: Text(
            "프레임워크: ",
            style: Text_style.copyWith(fontSize: fontSize),
          ),
        ),
        SizedBox(
          width: screenWidth * 0.17,
          child: Row(
            children:
                model.Framwork.map(
                  (x) => Text(
                    x,
                    style: Text_style.copyWith(
                      fontSize: fontSize,
                      color: DataUtils.SkillColor(skilname: x),
                    ),
                  ),
                ).toList(),
          ),
        ),
      ],
    );
  }
}

class Language extends StatelessWidget {
  final Skils_Model model;
  final double fontSize;
  const Language({super.key, required this.model, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(
          width: screenWidth * 0.17,
          child: Text("언어: ", style: Text_style.copyWith(fontSize: fontSize)),
        ),
        SizedBox(
          width: screenWidth * 0.17,
          child: Row(
            children:
                model.Language.expand(
                  (x) => [
                    Text(
                      x,
                      style: Text_style.copyWith(
                        fontSize: fontSize,
                        color: DataUtils.SkillColor(skilname: x),
                      ),
                    ),

                    SizedBox(width: screenWidth * 0.01),
                  ],
                ).toList(),
          ),
        ),
      ],
    );
  }
}
