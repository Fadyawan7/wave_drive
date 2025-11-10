import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String frame;
  final String animation;

  const ImageView({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.frame,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: InteractiveViewer(
            child: Image.network(
              imageUrl,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
