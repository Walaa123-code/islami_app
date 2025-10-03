import 'package:flutter/material.dart';
import 'package:islami_n/utils/app_colors.dart';
import 'package:islami_n/utils/app_style.dart';

class AskarWidget extends StatelessWidget {
  AskarWidget({super.key, required this.text, required this.image});

  String text;
  String image;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(width: 1.5, color: AppColors.primaryDark)),
        color: AppColors.blackOpColor,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: height * 0.20,
                width: width * 0.4,
              ),
              Text(text, style: AppStyles.bold18White),
            ],
          ),
        ),
      ),
    );
  }
}
