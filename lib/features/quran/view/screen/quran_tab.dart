import 'package:flutter/material.dart';
import 'package:islami_n/features/quran/view/widget/sura_details_screen.dart';
import 'package:islami_n/utils/app_colors.dart';
import 'package:islami_n/utils/app_style.dart';
import 'package:islami_n/utils/assets_manager.dart';

class QuranTab extends StatelessWidget {
  static const String routeName = 'quran';

  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AssetsManager.quranBg,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Container(
            margin: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AssetsManager.logo),
                TextField(
                  style: TextStyle(color: AppColors.primaryDark),
                  cursorColor: AppColors.primaryDark,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: AppColors.primaryDark,
                            width: 1,
                          )),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: AppColors.primaryDark,
                          width: 1,
                        ),
                      ),
                      prefixIcon: Image.asset(
                        'assets/images/prefix_icon.png',
                        color: AppColors.primaryDark,
                      ),
                      hintText: 'Sura Name',
                      hintStyle: const TextStyle(color: AppColors.whiteColor)),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Most Recently',
                      style: AppStyles.bold16White,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: 150,
                  width: 280,
                  decoration: BoxDecoration(
                      color: AppColors.primaryDark,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Anbiya",
                              style: AppStyles.bold24Black,
                            ),
                            Text(
                              "الأنبياء",
                              style: AppStyles.bold24Black,
                            ),
                            Text(
                              "112 Verses  ",
                              style: AppStyles.bold14Black,
                            ),
                          ],
                        ),
                        Image.asset(AssetsManager.mostRecently)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Suras List',
                      style: AppStyles.bold16White,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                InkWell(
                    child: Row(
                      children: [
                        Image.asset(AssetsManager.vector),
                        SizedBox(width: 24),
                        Column(
                          children: [
                            Text("Al-Fatiha", style: AppStyles.bold20White),
                            SizedBox(height: 10),
                            Text(
                              "7 Verses",
                              style: AppStyles.bold14White,
                            ),
                          ],
                        ),
                        SizedBox(width: 140),
                        Text(
                          "الفاتحه",
                          style: AppStyles.bold20White,
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SuraDetailsScreen();
                        },
                      ));
                    }),
                SizedBox(height: 10),
                Divider(
                  color: AppColors.whiteColor,
                  endIndent: 60,
                  indent: 60,
                  thickness: 1,
                ),
                SizedBox(height: 10),
                // InkWell(
                //   child: Row(
                //     children: [
                //       Image.asset(AssetsManager.vector),
                //       SizedBox(width: 24),
                //       Column(
                //         children: [
                //           Text("Al-Fatiha", style: AppStyles.bold20White),
                //           SizedBox(height: 15),
                //           Text(
                //             "7 Verses",
                //             style: AppStyles.bold14White,
                //           ),
                //         ],
                //       ),
                //       SizedBox(width: 145),
                //       Text(
                //         "الفاتحه",
                //         style: AppStyles.bold20White,
                //       )
                //     ],
                //   ),
                //   onTap: () {
                //     Navigator.push(context, MaterialPageRoute(builder: (context) {
                //       return SuraDetailsScreen();
                //     }));
                //   },
                // ),
                // SizedBox(height: 10),
                // Divider(
                //   color: AppColors.whiteColor,
                //   endIndent: 60,
                //   indent: 60,
                //   thickness: 1,
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
