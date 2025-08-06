import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_page/component/sized_box_component.dart';
import 'package:my_page/component/sized_box_text_component.dart';
import 'package:my_page/component/text_component.dart';

import '../common/data/data.dart';
import '../common/model/skils_model.dart';
import 'link_text_component.dart';

class WebPortfolioComponent extends StatelessWidget {
  final Skils_Model model;
  const WebPortfolioComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(ScreenWidth(context) * 0.015),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: ScreenWidth(context) * 0.01),
            Image_GIF(
              title: model.title,
              gif_path: model.gif_path,

              isMaking: model.isMaking,
              screenWidth: ScreenWidth(context),
            ),
            SkillDescriptor(model: model), //
            SizedBox(width: ScreenWidth(context) * 0.03),
            Descriptor(
              descriptor: model.descriptor,
              Language: model.Language,
              Language_skil: model.Language_skil,
            ),

            SizedBox(height: ScreenWidth(context) * 0.02),
          ],
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  final String title;
  final bool isMaking;
  const Title({super.key, required this.title, required this.isMaking});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextComponent(
          text: title + (isMaking ? " (개발 중...)" : ""),
          ratio: 0.030,
        ),
      ],
    );
  }
}

class Image_GIF extends StatelessWidget {
  final String gif_path;
  final double screenWidth;
  final String title;
  final bool isMaking;
  const Image_GIF({
    super.key,
    required this.gif_path,
    required this.screenWidth,
    required this.title,
    required this.isMaking,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Title(title: title, isMaking: isMaking),
        SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.black),
          ),
          child: Image.asset(
            gif_path,
            width: ScreenWidth(context) / 2,
            fit: BoxFit.cover,
            gaplessPlayback: true,
          ),
        ),
      ],
    );
  }
}

class Descriptor extends StatelessWidget {
  final List<String> Language;
  final List<String> Language_skil;
  final String descriptor;
  const Descriptor({
    super.key,
    required this.Language,
    required this.Language_skil,
    required this.descriptor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenWidth(context) * 0.55,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: ScreenWidth(context) * 0.03),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
                descriptor
                    .split("\n")
                    .map((x) => TextComponent(text: x, ratio: 0.02))
                    .toList(),
          ),
        ],
      ),
    );
  }
}

class SkillDescriptor extends StatelessWidget {
  final Skils_Model model;
  const SkillDescriptor({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenWidth(context) * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: ScreenWidth(context) * 0.04),
          Language(model: model),
          SizedBox(height: ScreenWidth(context) * 0.01),
          Framwork(model: model),
          // SizedBox(height: ScreenWidth(context) * 0.01),
          // Library(model: model, fontSize: fontSize),
          SizedBox(height: ScreenWidth(context) * 0.01),
          Platform(model: model),
          SizedBox(height: ScreenWidth(context) * 0.01),
          Personnel(model: model),
          SizedBox(height: ScreenWidth(context) * 0.01),
          if (model.git_link.isNotEmpty) GitLink(model: model),
          SizedBox(height: ScreenWidth(context) * 0.01),
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
                        const TextComponent(text: ",", ratio: 0.025),
                        SizedBoxComponent(widthRatio: 0.01),
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
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: ScreenWidth(context) * 0.17,
              child: const TextComponent(text: "패키지: ", ratio: 0.025),
            ),
          ],
        ),

        SizedBox(
          width: ScreenWidth(context) * 0.30,
          child: TextComponent(text: model.package.join(" "), ratio: 0.025),
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
          child: const TextComponent(text: "플랫폼: ", ratio: 0.025),
        ),

        Row(
          children:
              model.platform
                  .expandIndexed(
                    (i, x) => [
                      TextComponent(text: x, ratio: 0.025),
                      if (model.platform.length - 1 != i)
                        SizedBox(width: ScreenWidth(context) * 0.02),
                    ],
                  )
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
          child: const TextComponent(text: "라이브러리: ", ratio: 0.025),
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
          child: const TextComponent(text: "프레임워크: ", ratio: 0.025),
        ),

        SizedBox(
          width: ScreenWidth(context) * 0.3,

          child: Row(
            children:
                model.Framwork.expandIndexed(
                  (i, x) => [
                    TextComponent(text: x, ratio: 0.025),
                    if (i != model.Framwork.length - 1)
                      SizedBox(width: ScreenWidth(context) * 0.02),
                  ],
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
          child: const TextComponent(text: "언어: ", ratio: 0.025),
        ),
        SizedBox(
          width: ScreenWidth(context) * 0.3,
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
