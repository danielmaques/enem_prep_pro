import 'package:flutter/material.dart';

import '../style/app_colors.dart';

class ProTextFormField extends StatelessWidget {
  const ProTextFormField({
    super.key,
    required this.label,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.obscureText = false,
    this.suffixIcon,
    this.controller,
  });

  final String label;
  final TextInputType? keyboardType;
  final String Function(String?)? validator;
  final Function(String?)? onChanged;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.WHITEF5,
        borderRadius: BorderRadius.circular(100),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: suffixIcon,
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
        ),
        obscureText: obscureText,
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
