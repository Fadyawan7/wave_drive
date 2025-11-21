import 'package:flutter/material.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [Positioned.fill(child: child)]),
    );
  }
}
