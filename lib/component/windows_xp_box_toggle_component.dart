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
  bool _expanded = false;
  late final Widget _cachedChild;

  @override
  void initState() {
    super.initState();
    _cachedChild = WindowsXpWhiteBoxComponent(child: widget.child);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: WindowsExplorerComponent(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  },
                  child: SizedBox(
                    width: screenWidth * 0.6,
                    child: Text(
                      widget.title,
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                ),
              ),
              AnimatedSize(
                duration: Duration(milliseconds: 400),
                alignment: Alignment.topCenter,
                curve: Curves.ease,
                child: ClipRect(
                  child: Align(
                    heightFactor: _expanded ? 1 : 0,
                    alignment: Alignment.topCenter,
                    child: _cachedChild,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
