import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';

class TextFieldCustom extends StatefulWidget {
  const TextFieldCustom(
      {super.key,
      this.hintText,
      required int maxLines,
      this.controller,
      this.keyboardType,
      this.obscureText = false,
      this.validator,
      this.prefixIcon,
      this.shadowColor});

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? hintText;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Color? shadowColor;

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  bool hidden = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        obscureText: (widget.obscureText && hidden),
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          prefixIconColor: Colors.grey,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: AppColors.blackcolor,
            fontSize: 16,
          ),
          filled: true,
          fillColor: AppColors.inputboxcolor,
          suffixIcon: widget.obscureText
              ? GestureDetector(
                  onTap: () {
                    setState(() => hidden = !hidden);
                  },
                  child: Icon(
                    hidden ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                    size: 20,
                  ),
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.inputboxcolor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.inputboxcolor,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}
