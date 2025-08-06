import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_page/component/link_text_component.dart';
import 'package:my_page/component/sized_box_component.dart';
import 'package:my_page/component/sized_box_text_component.dart';
import 'package:my_page/component/text_component.dart';

import '../common/data/data.dart';
import '../common/model/skils_model.dart';

class AppPortfolioComponent extends StatelessWidget {
  final Skils_Model model;
  const AppPortfolioComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(ScreenWidth(context) * 0.015),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(height: ScreenWidth(context) * 0.01),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      model.isRight
                          ? [
                            Image_GIF(model: model),
                            SizedBox(width: ScreenWidth(context) * 0.02),
                            Descriptor(model: model),
                          ]
                          : [
                            Descriptor(model: model),
                            // SizedBox(width: ScreenWidth(context) * 0.03),
                            Image_GIF(model: model),
                          ],
                ),
                SizedBox(height: ScreenWidth(context) * 0.03),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...model.descriptor
                        .split("\n")
                        .map((x) => TextComponent(text: x, ratio: 0.020)),
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
    return Row(children: [TextComponent(text: model.title, ratio: 0.025)]);
  }
}

class Image_GIF extends StatelessWidget {
  final Skils_Model model;
  const Image_GIF({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Title(model: model),
        SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.black),
          ),
          child: Image.asset(
            model.gif_path,
            width: ScreenWidth(context) / 4,
            gaplessPlayback: true,
          ),
        ),
      ],
    );
  }
}

class Descriptor extends StatelessWidget {
  final Skils_Model model;
  const Descriptor({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenWidth(context) * 0.40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: ScreenWidth(context) * 0.08),
          Language(model: model),
          SizedBox(height: ScreenWidth(context) * 0.02),
          Framwork(model: model),
          SizedBox(height: ScreenWidth(context) * 0.02),
          Platform(model: model),
          SizedBox(height: ScreenWidth(context) * 0.02),
          Personnel(model: model),
          SizedBox(height: ScreenWidth(context) * 0.02),
          if (model.git_link.isNotEmpty) GitLink(model: model),
          SizedBox(height: ScreenWidth(context) * 0.03),
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
        SizedBoxTextComponent(text: "Github: ", ratio: 0.025, widthRatio: 0.17),
        Row(
          children:
              model.git_link
                  .expandIndexed(
                    (i, x) => [
                      LinkTextComponent(text: "링크", link: x, ratio: 0.025),
                      if (i != model.git_link.length - 1) ...[
                        const TextComponent(text: ",", ratio: 0.25),
                        SizedBoxComponent(widthRatio: 0.02),
                      ],
                    ],
                  )
                  .toList(),
        ),
      ],
    );
  }
}

class Package extends StatelessWidget {
  final Skils_Model model;
  const Package({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            SizedBoxTextComponent(text: "패키지:", ratio: 0.025, widthRatio: 0.17),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...model.package
                .expandIndexed((i, x) => [TextComponent(text: x, ratio: 0.022)])
                .toList(),
          ],
        ),
      ],
    );
  }
}

class Personnel extends StatelessWidget {
  final Skils_Model model;
  const Personnel({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: ScreenWidth(context) * 0.17,
          child: const TextComponent(text: "개발 인원: ", ratio: 0.025),
        ),

        TextComponent(
          text:
              model.personnel.toString() +
              "명" +
              (model.personnel == 1 ? " (개인)" : ""),
          ratio: 0.025,
        ),
      ],
    );
  }
}

class Platform extends StatelessWidget {
  final Skils_Model model;
  const Platform({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: ScreenWidth(context) * 0.17,
          child: TextComponent(text: "플랫폼: ", ratio: 0.025),
        ),

        Row(
          children:
              model.platform
                  .map((x) => TextComponent(text: x, ratio: 0.025))
                  .toList(),
        ),
      ],
    );
  }
}

class Library extends StatelessWidget {
  final Skils_Model model;
  const Library({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: ScreenWidth(context) * 0.17,
          child: TextComponent(text: "라이브러리: ", ratio: 0.025),
        ),

        Row(
          children:
              model.Language_skil.expand(
                (x) => [
                  TextComponent(text: x, ratio: 0.025),
                  SizedBox(width: ScreenWidth(context) * 0.02),
                ],
              ).toList(),
        ),
      ],
    );
  }
}

class Framwork extends StatelessWidget {
  final Skils_Model model;
  const Framwork({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: ScreenWidth(context) * 0.17,
          child: TextComponent(text: "프레임워크: ", ratio: 0.025),
        ),
        SizedBox(
          width: ScreenWidth(context) * 0.17,
          child: Row(
            children:
                model.Framwork.map(
                  (x) => TextComponent(text: x, ratio: 0.025),
                ).toList(),
          ),
        ),
      ],
    );
  }
}

class Language extends StatelessWidget {
  final Skils_Model model;
  const Language({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: ScreenWidth(context) * 0.17,
          child: TextComponent(text: "언어: ", ratio: 0.025),
        ),
        SizedBox(
          width: ScreenWidth(context) * 0.17,
          child: Row(
            children:
                model.Language.expand(
                  (x) => [
                    TextComponent(text: x, ratio: 0.025),

                    SizedBox(width: ScreenWidth(context) * 0.01),
                  ],
                ).toList(),
          ),
        ),
      ],
    );
  }
}
