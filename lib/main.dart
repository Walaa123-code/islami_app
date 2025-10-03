import 'package:flutter/material.dart';
import 'package:islami_n/features/home/view/widget/complete_duaa.dart';
import 'package:islami_n/features/home/view/widget/quran_benefit.dart';
import 'package:islami_n/features/providers/app_theme_provider.dart';
import 'package:islami_n/features/quran/view/widget/sura_details_screen.dart';
import 'package:islami_n/features/splash/view/screen/splash_screen.dart';
import 'package:islami_n/features/time/view/screen/time_tab.dart';
import 'package:islami_n/utils/app_theme.dart';
import 'package:provider/provider.dart';

import 'features/hadith/view/screen/hadith_tab.dart';
import 'features/hadith/view/widget/hadith_details_screen.dart';
import 'features/home/view/screen/home_screen.dart';
import 'features/on_boarding/screen/onboard_screen.dart';
import 'features/providers/radio_provider.dart';
import 'features/quran/view/screen/quran_tab.dart';
import 'features/radio/view/screen/radio_tab.dart';
import 'features/sebha/sebha_tab.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => RadioProvider()),
      ChangeNotifierProvider(create: (context) => AppThemeProvider())
    ], child: MyApp()),
    // Wrap your app
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        CompleteDuaa.routeName: (context) => CompleteDuaa(),
        QuranBenefit.routeName: (context) => QuranBenefit(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        // ScreenDetailsAskar.routeName: (context) => ScreenDetailsAskar(),
        HadithDetailsScreen.routeName: (context) => HadithDetailsScreen(),
        QuranTab.routeName: (context) => QuranTab(),
        HadithTab.routeName: (context) => HadithTab(),
        SebhaTab.routeName: (context) => SebhaTab(),
        RadioTab.routeName: (context) => RadioTab(),
        TimeTab.routeName: (context) => TimeTab(),
      },
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      themeMode: themeProvider.appTheme,
    );
  }
}
