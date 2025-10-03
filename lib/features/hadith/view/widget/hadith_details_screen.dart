import 'package:flutter/material.dart';
import 'package:islami_n/features/hadith/model/hadith_model.dart';
import 'package:islami_n/features/hadith/view/widget/hadith_content.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/assets_manager.dart';

class HadithDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadith_details';

  const HadithDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var args = ModalRoute.of(context)?.settings.arguments as HadithModel;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primaryDark),
        backgroundColor: AppColors.blackColor,
        toolbarHeight: height * 0.08,
        title: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text(
            args.title,
            style: AppStyles.bold25Primary,
          ),
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
                SizedBox(height: height * 0.03),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return HadithContent(content: args.contentHadith[index]);
                    },
                    itemCount: args.contentHadith.length,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
