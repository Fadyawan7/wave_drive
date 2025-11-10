// gradient_radio.dart

import 'package:flutter/material.dart';

Widget gradientRadio({
  required String value,
  required String? groupValue,
  required void Function(String?) onChanged,
}) {
  final bool isSelected = value == groupValue;

  return GestureDetector(
    onTap: () => onChanged(value),
    child: Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xff0AEBEE), Color(0xff8F29D0)],
            ),
          ),
          child: Center(
            child: Container(
              width: 20,
              height: 20,
              padding: isSelected ? const EdgeInsets.all(3) : EdgeInsets.zero,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white, // Middle circle background
              ),
              child: isSelected
                  ? Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Color(0xff0AEBEE), Color(0xff8F29D0)],
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ),
      ],
    ),
  );
}
