import 'package:flutter/material.dart';

class SplitView extends StatelessWidget {
  const SplitView({
    super.key,
    required this.menu,
    required this.content,
    this.breakpoint = 600,
    this.menuWidth = 240,
  });
  final Widget menu;
  final Widget content;
  final double breakpoint;
  final double menuWidth;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= breakpoint) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: menuWidth,
            child: menu,
          ),
          // Container(width: 0.5, color: Colors.black),
          Expanded(child: content),
        ],
      );
    } else {
      return menu;
    }
  }
}
