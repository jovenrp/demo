import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nrd/application/utils/app_colors.dart';
import 'package:nrd/application/widgets/spinner_loader.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.buttonText, this.textStyle, this.isLoading = false});

  final String buttonText;
  final TextStyle? textStyle;
  final GestureTapCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.warningOrange),
      ), child: isLoading ? const SizedBox(height: 20, width: 20, child: SpinnerLoader(),) : Text(buttonText, style: textStyle ?? const TextStyle(color: AppColors.lightText),),
    );
  }
}
