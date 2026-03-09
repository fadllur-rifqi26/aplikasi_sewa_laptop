import 'package:aplikasi_jasa_sewa_laptop/styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.textInputType,
    required this.textInputAction,
    required this.hint,
    this.isObscure = false,
    this.hasSuffix = false,
    this.onPressed,
    super.key,
  });

  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String hint;
  final bool isObscure;
  final bool hasSuffix;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextField(
                controller: controller,
                style: TextStyles.body,
                keyboardType: textInputType,
                textInputAction: textInputAction,
                obscureText: isObscure,
                decoration: InputDecoration(
                  suffixIcon: hasSuffix ? IconButton(
                    onPressed: onPressed, 
                    icon: Icon(
                      isObscure ? Icons.visibility_off: Icons.visibility, 
                      color: AppColors.darkGrey,
                    ),
                  ) : null,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(color: AppColors.darkGrey, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(color: AppColors.darkGrey, width: 1.0),
                  ),
                  hintText: hint,
                  hintStyle: TextStyles.body,
                ),
              );
  }
}