import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_n/utils/app_colors.dart';
import 'package:islami_n/utils/app_style.dart';
import 'package:islami_n/utils/assets_manager.dart';

import 'hadith_details_screen.dart';

class HadithTab extends StatefulWidget {
  static const String routeName = 'hadith';

  const HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Image.asset(
        AssetsManager.hadithBg,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
      Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Image.asset(AssetsManager.logo),
        Expanded(
            child: CarouselSlider.builder(
          itemCount: 100,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          HadithDetailsScreen.routeName,
                          // arguments: hadithList[itemIndex]
                        );
                      },
                      child: Expanded(
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.primaryDark,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(AssetsManager.hadithCover),
                            ),
                          ),
                          child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "الحديث الاول",
                                style: AppStyles.bold24Black,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                  child: Text(
                                ",الحديث الاول ,الحديث الاول,\nالحديث الاولالحديث الاولالحديث الاول\nالحديث الاولالحديث الاولالحديث الاول\nالحديث الاولالحديث الاولالحديث الاول\nالحديث الاولالحديث الاولالحديث الاول\nالحديث الاولالحديث الاولالحديث الاول\nالحديث الاولالحديث الاولالحديث الاول\n",
                                style: AppStyles.bold16Black,
                              )),
                            ],
                          ),
                        ),
                      )),
          options: CarouselOptions(
              height: 300,
              viewportFraction: 0.75,
              enableInfiniteScroll: false,
              enlargeCenterPage: true),
        )),
      ]))
    ]));
  }
}
