import 'package:flutter/material.dart';
import 'package:islami_n/features/home/view/screen/home_screen.dart';
import 'package:islami_n/utils/app_colors.dart';
import 'package:islami_n/utils/app_style.dart';
import 'package:islami_n/utils/assets_manager.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = 'sura_details';

  const SuraDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        toolbarHeight: 80,
        title: Text(
          "Al-Fatiha",
          style: AppStyles.bold20Primary,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image.asset(
            AssetsManager.coverContent,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Center(
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  "الفاتحه",
                  style: AppStyles.bold24Primary,
                ),
                const SizedBox(height: 30),
                Text(
                  "1] بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ [2] الْحَمْدُ لِلَّهِ رَبِّ \nالْعَالَمِينَ [3] الرَّحْمَنِ الرَّحِيمِ [4] مَالِكِ يَوْمِ الدِّي"
                  "نِ\n [5] إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ"
                  " [6] اهْدِنَا الصِّرَاطَ \nالْمُسْتَقِيمَ [7] صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ"
                  "\n الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّين",
                  style: AppStyles.bold20Primary,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
