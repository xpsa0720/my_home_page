import 'package:flutter/material.dart';
import 'package:my_page/component/windows_xp_box_component.dart';
import 'package:my_page/component/windows_xp_white_box_component.dart';

class WindowsXpBoxToggleComponent extends StatefulWidget {
  final Widget child;
  final String title;
  const WindowsXpBoxToggleComponent({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  State<WindowsXpBoxToggleComponent> createState() =>
      _WindowsXpBoxToggleComponentState();
}

class _WindowsXpBoxToggleComponentState
    extends State<WindowsXpBoxToggleComponent> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: WindowsExplorerComponent(
        child: ExpansionTile(
          title: Text(widget.title, style: TextStyle(fontSize: 25)),
          children: [
            AnimatedSize(
              duration: Duration(milliseconds: 1000),
              curve: Curves.ease,
              child: WindowsXpWhiteBoxComponent(child: widget.child),
            ),
          ],
        ),
      ),
    );
  }
}
