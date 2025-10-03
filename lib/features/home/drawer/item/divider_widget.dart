import 'package:flutter/material.dart';
import 'package:islami_n/utils/app_colors.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.whiteColor,
      thickness: 1,
      indent: 0,
      endIndent: 0,
    );
  }
}
