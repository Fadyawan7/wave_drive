import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, this.textError});

  final String? textError;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(textError ?? "Error"),
    );
  }
}
