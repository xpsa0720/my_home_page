import 'package:flutter/material.dart';

class BorderPictureComponent extends StatelessWidget {
  final double width;
  final String path;
  const BorderPictureComponent({
    super.key,
    required this.width,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.black),
      ),
      child: Image.asset(path, width: width, fit: BoxFit.cover),
    );
  }
}
