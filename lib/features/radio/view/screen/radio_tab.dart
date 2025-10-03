import 'package:flutter/material.dart';
import 'package:islami_n/features/radio/view/widget/radio_widget.dart';
import 'package:islami_n/features/radio/view/widget/reciters_widget.dart';
import 'package:islami_n/utils/assets_manager.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_style.dart';
import '../../data/Reciters_model.dart';
import '../../data/data.dart';
import '../../data/radio_model.dart';

class RadioTab extends StatefulWidget {
  static const String routeName = "radio_tab";

  @override
  // int selectedIndex = 0;
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          AssetsManager.radioBg,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            // SizedBox(
            //   height: height * 0.03,
            // ),
            Image.asset(AssetsManager.logo),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        backgroundColor: selectedIndex == 0
                            ? AppColors.primaryDark
                            : AppColors.blackColor,
                      ),
                      child: Text(
                        'Radio',
                        style: AppStyles.bold16White,
                      )),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        backgroundColor: selectedIndex == 1
                            ? AppColors.primaryDark
                            : AppColors.blackColor,
                      ),
                      child: Text(
                        'Reciters',
                        style: AppStyles.regular16White,
                      )),
                ),
              ),
            ]),
            selectedIndex == 0
                ? FutureBuilder<RadioModel>(
                    future: RadioData.getRadioData(),
                    builder: (BuildContext context,
                        AsyncSnapshot<RadioModel> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Expanded(
                          child: Center(
                              child: CircularProgressIndicator(
                            color: AppColors.primaryDark,
                          )),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: height * 0.15,
                              ),
                              Text(
                                "something went wrong",
                                style: AppStyles.medium20White,
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryDark,
                                  ),
                                  onPressed: () {
                                    RadioData.getRadioData();
                                    setState(() {});
                                  },
                                  child: Text("Try again",
                                      style: AppStyles.medium20White))
                            ],
                          ),
                        );
                      }
                      RadioModel data = snapshot.data!;

                      return Expanded(
                        child: ListView.builder(
                            padding:
                                EdgeInsets.symmetric(vertical: height * 0.01),
                            itemCount: data.radios!.length,
                            itemBuilder: (BuildContext context, int index) {
                              //  final radio = data.radios![index];
                              return RadioWidget(
                                model: data.radios![index],
                              );
                            }),
                      );
                    })
                : FutureBuilder<RecitersModel>(
                    future: RadioData.getRecitersData(),
                    builder: (BuildContext context,
                        AsyncSnapshot<RecitersModel> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Expanded(
                          child: Center(
                              child: CircularProgressIndicator(
                            color: AppColors.primaryDark,
                          )),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: height * 0.15,
                              ),
                              Text(
                                "something went wrong",
                                style: AppStyles.medium20White,
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryDark,
                                  ),
                                  onPressed: () {
                                    RadioData.getRecitersData();
                                    setState(() {});
                                  },
                                  child: Text("Try again",
                                      style: AppStyles.medium20White))
                            ],
                          ),
                        );
                      }
                      RecitersModel data = snapshot.data!;

                      return Expanded(
                        child: ListView.builder(
                            padding:
                                EdgeInsets.symmetric(vertical: height * 0.01),
                            itemCount: data.reciters!.length,
                            itemBuilder: (BuildContext context, int index) {
                              //  final radio = data.radios![index];
                              return RecitersWidget(
                                  model: data.reciters![index]);
                            }),
                      );
                    })
          ]),
        )
      ]),
    );
  }
}
