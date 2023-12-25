import 'package:driver_monitoring_application/styles/app_colors.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.blue,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
      decoration: const InputDecoration(
        errorStyle: TextStyle(
          color: AppColors.blue,
          fontWeight: FontWeight.w500,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.blue,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.blue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        labelText: 'Login',
        labelStyle: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      validator: (input) {
        if (input != null) {
          return input;
        }
        return null;
      },
    );
  }
}
