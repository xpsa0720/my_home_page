import 'package:flutter/material.dart';

class WindowsExplorerComponent extends StatelessWidget {
  final Widget? child;
  const WindowsExplorerComponent({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // width: widget.boxWidth,
          decoration: BoxDecoration(
            color: Color(0xFFD4D0C8),
            border: Border(
              top: BorderSide(color: Colors.white, width: 2),
              left: BorderSide(color: Colors.white, width: 2),
              right: BorderSide(color: Color(0xFF485052), width: 2),
              bottom: BorderSide(color: Color(0xFF485052), width: 2),
            ),
          ),
          child: child,
        ),
      ],
    );
  }
}
