import 'package:flutter/material.dart';

class BorderTextComponent extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? borderColor;
  final double? size;
  final double? height;
  final FontWeight? fontWeight;
  final double? width;
  const BorderTextComponent({
    super.key,
    required this.text,
    this.color,
    this.borderColor,
    this.size,
    this.fontWeight,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width ?? null,
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'neo',
              fontSize: size ?? 18,
              // color: Colors.white,
              foreground:
                  Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 1.1
                    ..color = borderColor ?? Colors.black,
              fontWeight: fontWeight,
              height: height ?? 0,
            ),
          ),
        ),
        Container(
          width: width ?? null,
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'neo',
              fontSize: size ?? 18,
              color: color ?? Colors.white,
              fontWeight: fontWeight,
              height: height ?? 0,
            ),
          ),
        ),
      ],
    );
  }
}
