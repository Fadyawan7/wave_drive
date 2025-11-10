import 'package:flutter/material.dart';

class TabBarItem extends StatelessWidget {
  const TabBarItem({
    super.key,
    this.text,
    this.icon,
    this.child,
  });

  final String? text;
  final Widget? icon;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Tab(
      
      
      iconMargin: EdgeInsets.zero,
      height: 32,
      icon: icon,
      text: text,
      child: child,
    );
  }
}
