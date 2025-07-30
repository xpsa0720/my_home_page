import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_page/common/text/style/text_style.dart';
import 'package:my_page/common/util/dat_util.dart';
import 'package:my_page/component/sized_box_text_component.dart';

import '../common/model/skils_model.dart';
import 'link_text_component.dart';

class WebPortfolioComponent extends StatefulWidget {
  final Skils_Model model;
  const WebPortfolioComponent({super.key, required this.model});

  @override
  State<WebPortfolioComponent> createState() => _WebPortfolioComponentState();
}

class _WebPortfolioComponentState extends State<WebPortfolioComponent> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.015),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenWidth * 0.01),

            Image_GIF(
              title: widget.model.title,
              gif_path: widget.model.gif_path,
              isMaking: widget.model.isMaking,
              screenWidth: screenWidth,
            ),
            SkillDescriptor(
              fontSize: screenWidth * 0.025,
              model: widget.model,
            ), //
            SizedBox(width: screenWidth * 0.03),
            Descriptor(
              descriptor: widget.model.descriptor,
              Language: widget.model.Language,
              Language_skil: widget.model.Language_skil,
              fontSize: screenWidth * 0.025,
            ),

            SizedBox(height: screenWidth * 0.02),
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
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title + (isMaking ? " (개발 중...)" : ""),
          style: Text_style.copyWith(fontSize: screenWidth * 0.030),
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
            width: screenWidth / 2,
            fit: BoxFit.cover,
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
  final double fontSize;
  const Descriptor({
    super.key,
    required this.Language,
    required this.Language_skil,
    required this.descriptor,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.55,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: screenWidth * 0.03),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
                descriptor
                    .split("\n")
                    .map(
                      (x) => Text(
                        x,
                        style: Text_style.copyWith(fontSize: fontSize * 0.8),
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }
}

class SkillDescriptor extends StatelessWidget {
  final Skils_Model model;
  final double fontSize;
  const SkillDescriptor({
    super.key,
    required this.model,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: screenWidth * 0.04),
          Language(fontSize: fontSize, model: model),
          SizedBox(height: screenWidth * 0.01),
          Framwork(fontSize: fontSize, model: model),
          // SizedBox(height: screenWidth * 0.01),
          // Library(model: model, fontSize: fontSize),
          SizedBox(height: screenWidth * 0.01),
          Platform(model: model, fontSize: fontSize),
          SizedBox(height: screenWidth * 0.01),
          Personnel(model: model, fontSize: fontSize),
          SizedBox(height: screenWidth * 0.01),
          if (model.git_link != null) GitLink(model: model),
          SizedBox(height: screenWidth * 0.01),
          if (model.package.isNotEmpty)
            Package(model: model, fontSize: fontSize),
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
        SizedBoxTextComponent(text: "Github: ", ratio: 0.03, widthRatio: 0.17),
        LinkTextComponent(text: "링크", link: model.git_link!, ratio: 0.025),
      ],
    );
  }
}

class Package extends StatelessWidget {
  final Skils_Model model;
  final double fontSize;
  const Package({super.key, required this.model, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: screenWidth * 0.17,
              child: Text(
                "패키지: ",
                style: Text_style.copyWith(fontSize: fontSize),
              ),
            ),
          ],
        ),

        SizedBox(
          width: screenWidth * 0.30,
          child: Text(
            model.package.join(" "),
            style: Text_style.copyWith(fontSize: fontSize),
          ),
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
                  .expandIndexed(
                    (i, x) => [
                      Text(x, style: Text_style.copyWith(fontSize: fontSize)),
                      if (model.platform.length - 1 != i)
                        SizedBox(width: screenWidth * 0.02),
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
          width: screenWidth * 0.3,

          child: Row(
            children:
                model.Framwork.expandIndexed(
                  (i, x) => [
                    Text(
                      x,
                      style: Text_style.copyWith(
                        fontSize: fontSize,
                        color: DataUtils.SkillColor(skilname: x),
                      ),
                    ),
                    if (i != model.Framwork.length - 1)
                      SizedBox(width: screenWidth * 0.02),
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
          width: screenWidth * 0.3,
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
