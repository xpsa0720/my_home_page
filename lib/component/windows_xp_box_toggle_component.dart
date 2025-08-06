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
    extends State<WindowsXpBoxToggleComponent>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;
  late AnimationController _controller;
  late Animation<double> _heightFactor;
  late final Widget _cachedChild;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _heightFactor = CurvedAnimation(parent: _controller, curve: Curves.ease);

    _cachedChild = WindowsXpWhiteBoxComponent(child: widget.child);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _expanded = !_expanded;
      if (_expanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
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
                  onTap: _toggle,
                  child: SizedBox(
                    width: screenWidth * 0.8,
                    child: Text(
                      widget.title,
                      style: TextStyle(fontSize: screenWidth * 0.022),
                    ),
                  ),
                ),
              ),
              AnimatedBuilder(
                animation: _heightFactor,
                builder: (context, child) {
                  return ClipRect(
                    child: Align(
                      heightFactor: _heightFactor.value,
                      alignment: Alignment.topCenter,
                      child: child,
                    ),
                  );
                },
                child: RepaintBoundary(child: _cachedChild),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
