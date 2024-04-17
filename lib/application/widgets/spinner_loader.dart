import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class SpinnerLoader extends StatelessWidget {
  const SpinnerLoader({
    super.key,
    this.backgroundColor,
    this.strokeWidth,
  });

  final Color? backgroundColor;
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? 4.0,
        valueColor: AlwaysStoppedAnimation<Color>(backgroundColor ?? AppColors.foreground),
      ),
    );
  }
}