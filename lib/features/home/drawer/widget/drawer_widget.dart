import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_style.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key, required this.icon, required this.text});

  String text;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.whiteColor,
          size: 28,
        ),
        SizedBox(
          width: width * 0.02,
        ),
        Text(
          text,
          style: AppStyles.bold20White,
        )
      ],
    );
  }
}
