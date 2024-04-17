
import 'package:flutter/material.dart';
import 'package:nrd/application/utils/app_colors.dart';

class CustomPassword extends StatelessWidget {
  const CustomPassword({super.key, this.color, required this.controller});

  final Color? color;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: AppColors.lightText),
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock_outline, color: color ?? AppColors.lightText,),
        hintText: 'password',
        hintStyle: const TextStyle(fontSize: 14, color: AppColors.headerGrey),
      ),
    );
  }
}