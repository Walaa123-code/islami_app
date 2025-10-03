import 'package:flutter/material.dart';
import 'package:islami_n/features/providers/app_theme_provider.dart';
import 'package:islami_n/utils/app_colors.dart';
import 'package:islami_n/utils/app_style.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Container(
      height: height * 0.35,
      decoration: BoxDecoration(
          color: AppColors.blackColor, borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.02, horizontal: width * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
                onTap: () {
                  // change theme to  dark
                  themeProvider.changeTheme(ThemeMode.dark);
                },
                child: themeProvider.isLightMode()
                    ? getUnSelectedItemWidget("داكن")
                    : getSelectedItemWidget("داكن")),
            SizedBox(
              height: height * 0.02,
            ),
            InkWell(
                onTap: () {
                  // change theme to light
                  themeProvider.changeTheme(ThemeMode.light);
                },
                child: themeProvider.isLightMode()
                    ? getSelectedItemWidget("ساطع")
                    : getUnSelectedItemWidget("ساطع")),
          ],
        ),
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppStyles.bold20Primary,
        ),
        Icon(
          Icons.check,
          color: AppColors.primaryDark,
          size: 25,
        )
      ],
    );
  }

  Widget getUnSelectedItemWidget(String text) {
    return Text(
      text,
      style: AppStyles.bold20White,
    );
  }
}
