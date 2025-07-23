import 'package:flutter/material.dart';
import 'package:my_page/common/text/style/text_style.dart';

import '../common/color/skil_text_color.dart';
import '../common/model/skils_model.dart';
import 'border_text_component.dart';

class PortfolioComponent extends StatefulWidget {
  final Skils_Model model;
  const PortfolioComponent({super.key, required this.model});

  @override
  State<PortfolioComponent> createState() => _PortfolioComponentState();
}

class _PortfolioComponentState extends State<PortfolioComponent> {
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
                            Image_GIF(
                              title: widget.model.title,
                              gif_path: widget.model.gif_path,
                              screenWidth: screenWidth,
                            ),
                            SizedBox(width: screenWidth * 0.03),
                            Descriptor(
                              descriptor: widget.model.descriptor,
                              Language: widget.model.Language,
                              Language_skil: widget.model.Language_skil,
                              fontSize: screenWidth * 0.025,
                            ),
                          ]
                          : [
                            Descriptor(
                              descriptor: widget.model.descriptor,
                              Language: widget.model.Language,
                              Language_skil: widget.model.Language_skil,
                              fontSize: screenWidth * 0.025,
                            ),
                            SizedBox(width: screenWidth * 0.03),
                            Image_GIF(
                              title: widget.model.title,
                              gif_path: widget.model.gif_path,
                              screenWidth: screenWidth,
                            ),
                          ],
                ),
                SizedBox(height: screenWidth * 0.06), // 두 Column 사이에 간격 주기
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  final String title;
  const Title({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Text(title, style: Text_style.copyWith(fontSize: screenWidth * 0.020)),
      ],
    );
  }
}

class Image_GIF extends StatelessWidget {
  final String gif_path;
  final double screenWidth;
  final String title;
  const Image_GIF({
    super.key,
    required this.gif_path,
    required this.screenWidth,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Title(title: title),
        SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.black),
          ),
          child: Image.asset(gif_path, width: screenWidth / 4),
        ),
      ],
    );
  }
}

class Descriptor extends StatelessWidget {
  final String Language;
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
      width: screenWidth * 0.39,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: screenWidth * 0.08),
          Text("사용된 기술", style: Text_style.copyWith(fontSize: fontSize)),
          SizedBox(height: screenWidth * 0.01),

          Row(
            children: [
              BorderTextComponent(
                text: Language,
                color: FLUTTER_COLOR,
                size: fontSize,
                borderColor: Colors.transparent,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(width: screenWidth * 0.01),
              if (Language_skil.isNotEmpty)
                BorderTextComponent(
                  text: "-",
                  color: Colors.black,
                  size: fontSize,
                  borderColor: Colors.transparent,
                  fontWeight: FontWeight.w400,
                ),

              SizedBox(width: screenWidth * 0.01),
              BorderTextComponent(
                text: Language_skil.join(", "),
                color: Colors.black,
                size: fontSize,
                borderColor: Colors.transparent,
                fontWeight: FontWeight.w600,
                width: screenWidth * 0.25,
              ),
            ],
          ),
          SizedBox(height: screenWidth * 0.02),
          Row(
            children: [
              BorderTextComponent(
                text: descriptor,
                color: Colors.black,
                size: fontSize * 0.7,
                borderColor: Colors.transparent,
                fontWeight: FontWeight.w300,
                height: 1.6,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
