
import 'package:flutter/material.dart';
import 'package:nrd/application/utils/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key, this.color, required this.controller, this.hint, this.icon, this.textInputType});

  final Color? color;
  final String? hint;
  final TextEditingController controller;
  final Icon? icon;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: AppColors.lightText),
      keyboardType: textInputType ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: '$hint',
        hintStyle: const TextStyle(fontSize: 14, color: AppColors.headerGrey),
        prefixIcon: icon ?? Icon(Icons.person_sharp, color: color ?? AppColors.lightText,),
      ),
    );
  }
}