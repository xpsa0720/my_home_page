import 'package:flutter/material.dart';

class WindowsXpWhiteBoxComponent extends StatelessWidget {
  const WindowsXpWhiteBoxComponent({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [child],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(color: Color(0xFF485052), width: 2),
            top: BorderSide(color: Color(0xFF485052), width: 2),
            bottom: BorderSide(color: Colors.black, width: 1),
            right: BorderSide(color: Colors.black, width: 1),
          ),
        ),
      ),
    );
  }
}
