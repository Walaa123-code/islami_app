import 'package:flutter/material.dart';
import 'package:islami_n/features/home/drawer/item/divider_widget.dart';
import 'package:islami_n/features/home/drawer/widget/drawer_widget.dart';
import 'package:islami_n/features/home/drawer/widget/theme_bottom_sheet.dart';
import 'package:islami_n/features/home/view/widget/complete_duaa.dart';
import 'package:islami_n/features/home/view/widget/quran_benefit.dart';
import 'package:islami_n/features/providers/app_theme_provider.dart';
import 'package:islami_n/utils/app_colors.dart';
import 'package:islami_n/utils/app_style.dart';
import 'package:provider/provider.dart';

import '../../view/screen/home_screen.dart';

class DrawerItem extends StatefulWidget {
  const DrawerItem({super.key});

  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Drawer(
      width: width * 0.6,
      backgroundColor: AppColors.blackTrColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.02,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 35,
            ),
            Text(
              "Islami App",
              style: AppStyles.bold28Primary,
            ),
            SizedBox(
              height: height * 0.08,
            ),
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ));
                },
                child: DrawerWidget(
                    icon: Icons.home_outlined, text: "القائمة الرئيسية")),
            SizedBox(
              height: height * 0.01,
            ),
            DividerWidget(),
            SizedBox(
              height: height * 0.01,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return QuranBenefit();
                  },
                ));
              },
              child: DrawerWidget(
                icon: Icons.favorite_border,
                text: 'فضل قراءة القرأن',
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            DividerWidget(),
            SizedBox(
              height: height * 0.01,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return CompleteDuaa();
                  },
                ));
              },
              child: DrawerWidget(
                icon: Icons.menu_book_sharp,
                text: 'دعاء ختم القران',
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            DividerWidget(),
            SizedBox(
              height: height * 0.01,
            ),
            DrawerWidget(icon: Icons.dark_mode_outlined, text: "المظهر"),
            SizedBox(
              height: height * 0.02,
            ),
            InkWell(
              onTap: () {
                showThemeBottomSheet();
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                  vertical: height * 0.01,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.whiteColor,
                    width: 1.5,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      themeProvider.isDarkMode() ? "داكن" : "ساطع",
                      style: AppStyles.medium20White,
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                      color: AppColors.whiteColor,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeBottomSheet());
  }
}
