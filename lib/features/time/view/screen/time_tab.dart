import 'package:audioplayers/audioplayers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_n/features/time/data/data.dart';
import 'package:islami_n/features/time/data/time_model.dart';
import 'package:islami_n/features/time/view/widget/askar/widget/screen_details_askar.dart';
import 'package:islami_n/utils/app_colors.dart';
import 'package:islami_n/utils/app_style.dart';
import 'package:islami_n/utils/date_utils.dart';

import '../../../../utils/assets_manager.dart';
import '../widget/askar/widget/askar_widget.dart';
import '../widget/time/counter_timer.dart';

class TimeTab extends StatefulWidget {
  static const String routeName = 'time';

  const TimeTab({super.key});

  @override
  State<TimeTab> createState() => _TimeTabState();
}

class _TimeTabState extends State<TimeTab> {
  final AudioPlayer audioPlayer = AudioPlayer();

  void playAdan() {
    audioPlayer.play(UrlSource("https://cdn.aladhan.com/audio/adhans/a4.mp3"),
        volume: 2);
  }

  void stopAdan() {
    audioPlayer.stop();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(children: [
      Image.asset(
        AssetsManager.timeBg,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Image.asset(AssetsManager.logo),
            FutureBuilder(
                future: TimeData.getTimeData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                      height: height * 0.30,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryDark,
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.09,
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
                                TimeData.getTimeData();
                                setState(() {});
                              },
                              child: Text("Try again",
                                  style: AppStyles.medium20White)),
                          SizedBox(
                            height: height * 0.09,
                          ),
                        ],
                      ),
                    );
                  }
                  TimeModel data = snapshot.data!;
                  Map<String, dynamic> prayerTimes =
                      PrayerTime.sortPrayerTimes(data.data!.timings!.toJson());
                  Map<String, Duration> prayerCountDown =
                      PrayerTime.getNextPraterCountDown(prayerTimes);
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: width * 0.01,
                    ),
                    height: height * 0.3,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.brownColor,
                        image: DecorationImage(
                            image: AssetImage(AssetsManager.prayerBg),
                            fit: BoxFit.fill)),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                            top: 10,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  DateFormatter.formatGregorian(
                                    data.data!.date!.gregorian!,
                                  ),
                                  // style: AppTheme.darkTheme.textTheme.headLineLarge,
                                  style: AppStyles.bold16White,
                                ),
                                Column(
                                  children: [
                                    AutoSizeText(
                                      "Pray Time",
                                      // style: AppTheme.darkTheme.textTheme.headLineLarge,
                                      style: AppStyles.bold18BlackOp,
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    AutoSizeText(
                                      data.data!.date!.gregorian!.weekday!.en!,
                                      // style: AppTheme.darkTheme.textTheme.headLineLarge,
                                      style: AppStyles.bold18Black,
                                    ),
                                  ],
                                ),
                                AutoSizeText(
                                  DateFormatter.formatHijri(
                                    data.data!.date!.hijri!,
                                  ),
                                  // style: AppTheme.darkTheme.textTheme.headLineLarge,
                                  style: AppStyles.bold16White,
                                ),
                              ],
                            )),
                        CarouselSlider.builder(
                          itemCount: prayerTimes.length,
                          itemBuilder: (context, index, realIndex) {
                            return Container(
                              // height: double.infinity,
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 40, left: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        AppColors.blackColor,
                                        AppColors.primaryDark
                                      ])),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  AutoSizeText(
                                    prayerTimes.keys.elementAt(index),
                                    // style: AppTheme.darkTheme.textTheme.headLineLarge,
                                    style: AppStyles.bold16White,
                                  ),
                                  AutoSizeText(
                                    TimeConverter.to12Hour(
                                        prayerTimes.values.elementAt(index)),

                                    // style: AppTheme.darkTheme.textTheme.headLineLarge,
                                    style: AppStyles.bold22White,
                                  ),
                                ],
                              ),
                            );
                          },
                          options: CarouselOptions(
                              height: height * 0.2,
                              enlargeFactor: 0.15,
                              viewportFraction: 0.3,
                              enlargeCenterPage: true),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: NextPrayWidget(
                            playAdan: playAdan,
                            stopAdan: stopAdan,
                            getPrayingData: () {
                              setState(() {
                                TimeData.getTimeData();
                              });
                            },
                            timeRemaining:
                                // Duration(seconds: 10),
                                prayerCountDown[prayerTimes.keys.first]!,
                          ),
                        )
                      ],
                    ),
                  );
                }),
            SizedBox(height: height * 0.03),
            Padding(
              padding: EdgeInsets.only(left: width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Askar',
                    style: AppStyles.bold16White,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                    child: AskarWidget(
                        text: "أذكار الصباح",
                        image: AssetsManager.morningAzkar),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ScreenDetailsAskar(type: "morning"),
                        ),
                      );
                    },
                  ),
                  InkWell(
                    child: AskarWidget(
                        text: "أذكار المساء",
                        image: AssetsManager.eveningAzkar),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ScreenDetailsAskar(type: "evening"),
                        ),
                      );
                    },
                  ),
                  InkWell(
                    child: AskarWidget(
                        text: "أذكار الصلاة",
                        image: AssetsManager.prophetsDuas),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ScreenDetailsAskar(type: "afterPrayer"),
                        ),
                      );
                    },
                  ),
                  InkWell(
                    child: AskarWidget(
                        text: "أذكار النوم",
                        image: AssetsManager.azkarBeforeSleep),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ScreenDetailsAskar(type: "sleep"),
                        ),
                      );
                    },
                  ),
                  InkWell(
                    child: AskarWidget(
                        text: "أدعية قرانية", image: AssetsManager.quranicDuas),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ScreenDetailsAskar(type: "quran"),
                        ),
                      );
                    },
                  ),
                  InkWell(
                    child: AskarWidget(
                        text: "أدعية الانبياء",
                        image: AssetsManager.prophetsDuas),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ScreenDetailsAskar(type: "prophets"),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ])),
    ]));
  }
}
