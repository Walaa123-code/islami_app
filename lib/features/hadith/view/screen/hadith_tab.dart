import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_n/features/hadith/model/hadith_model.dart';
import 'package:islami_n/features/hadith/view/widget/hadith_details_screen.dart';
import 'package:islami_n/utils/app_colors.dart';
import 'package:islami_n/utils/app_style.dart';
import 'package:islami_n/utils/assets_manager.dart';

class HadithTab extends StatefulWidget {
  static const String routeName = 'hadith';

  HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<HadithModel> hadithList = [];

  @override
  void initState() {
    super.initState();
    loadHadithFile();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AssetsManager.hadithBg,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Center(
            child: hadithList.isEmpty
                ? Center(
                    child: const CircularProgressIndicator(
                    color: AppColors.primaryDark,
                  ))
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(AssetsManager.logo),
                      CarouselSlider.builder(
                        itemCount: hadithList.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                HadithDetailsScreen.routeName,
                                arguments: hadithList[itemIndex]);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.primaryDark,
                              image: DecorationImage(
                                  image: AssetImage(AssetsManager.hadithCover),
                                  fit: BoxFit.fill),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.05,
                                  vertical: height * 0.02),
                              child: Column(
                                children: [
                                  Text(
                                    hadithList[itemIndex].title,
                                    style: AppStyles.bold24Black,
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Text(
                                        textAlign: TextAlign.justify,
                                        hadithList[itemIndex]
                                            .contentHadith
                                            .join('\n'),
                                        style: AppStyles.bold16Black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        options: CarouselOptions(
                            height: MediaQuery.of(context).size.height * 0.6,
                            viewportFraction: 0.70,
                            enlargeCenterPage: true),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  // void loadHadithFile() async {
  //   for (int i = 1; i <= 50; i++) {
  //     String hadithContent =
  //         await rootBundle.loadString("assets/files/hadith/h$i.txt");
  //     List<String> hadithLines = hadithContent.split("\n");
  //
  //     String title = hadithLines[0]; // title
  //     hadithLines.removeAt(0); // remove title
  //
  //     HadithModel hadithModel = HadithModel(
  //       contentHadith: hadithLines,
  //       title: title,
  //     );
  //
  //     setState(() {
  //       hadithList.add(hadithModel);
  //     });
  //   }
  // }
  void loadHadithFile() async {
    List<HadithModel> tempList = [];
    for (int i = 1; i <= 50; i++) {
      String hadithContent =
          await rootBundle.loadString("assets/files/hadith/h$i.txt");
      List<String> hadithLines = hadithContent.split("\n");

      String title = hadithLines[0];
      hadithLines.removeAt(0);

      tempList.add(HadithModel(
        contentHadith: hadithLines,
        title: title,
      ));
    }

    setState(() {
      hadithList = tempList;
    });
  }
}
