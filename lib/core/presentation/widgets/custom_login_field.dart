import 'package:flutter/material.dart';
import 'package:spoosk/core/colors.dart';

class LoginField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final String? Function(String?)? validator;

  const LoginField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.obscureText,
      required this.validator});

  @override
  State<LoginField> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        contentPadding: const EdgeInsets.all(10),
        hintStyle: const TextStyle(color: Color(0xFFC3C3C3)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.gray_border, width: 1.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.gray_border, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1.0),
        ),
        hintText: widget.hintText,
      ),
      controller: widget.controller,
      obscureText: widget.obscureText,
      validator: widget.validator,
    );
  }
}
