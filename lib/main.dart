import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:islami_n/features/hadith/view/screen/hadith_details_screen.dart';
import 'package:islami_n/features/provider/radio_provider.dart';
import 'package:islami_n/features/quran/view/widget/search_details.dart';
import 'package:islami_n/features/quran/view/widget/sura_details_screen.dart';
import 'package:islami_n/features/splash/view/screen/splash_screen.dart';
import 'package:provider/provider.dart';

import 'features/hadith/view/screen/hadith_tab.dart';
import 'features/home/view/screen/home_screen.dart';
import 'features/on_boarding/screen/first_onboard_page.dart';
import 'features/quran/view/screen/quran_tab.dart';
import 'features/radio/view/screen/radio_tab.dart';
import 'features/sebha/sebha_tab.dart';

// void main(){
//  // RadioData.getRadioData();
//   runApp(ChangeNotifierProvider(
//     create: (BuildContext context) => RadioProvider(),
//       child: MyApp()));// Wrap your app
//
// }
void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => ChangeNotifierProvider(
            create: (BuildContext context) => RadioProvider(),
            child: MyApp()), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RadioTab.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadithDetailsScreen.routeName: (context) => HadithDetailsScreen(),
        SearchDetails.routeName: (context) => SearchDetails(),
        QuranTab.routeName: (context) => QuranTab(),
        HadithTab.routeName: (context) => HadithTab(),
        SebhaTab.routeName: (context) => SebhaTab(),
        RadioTab.routeName: (context) => RadioTab(),
      },
    );
  }
}
