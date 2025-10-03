import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_n/utils/app_style.dart';

import '../../home/view/screen/home_screen.dart';
import '../widget/custom_widget_onboard.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String routeName = 'intro_screen';

  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Color(0xff202020),
      // isTopSafeArea: true,
      // isBottomSafeArea: true,
      freeze: true,
      pages: [
        PageViewModel(
            titleWidget: Image.asset(
              "assets/images/logo.png",
            ),
            bodyWidget: CustomWidgetOnboard(
                image: "assets/images/intro1.png",
                text: "Welcome To Islmi App")),
        PageViewModel(
            titleWidget: Image.asset("assets/images/logo.png"),
            bodyWidget: CustomWidgetOnboard(
              image: "assets/images/intro 2.png",
              text: "Welcome To Islami",
              description: "We Are Very Excited To Have You \nIn Our Community",
            )),
        PageViewModel(
            titleWidget: Image.asset("assets/images/logo.png"),
            bodyWidget: CustomWidgetOnboard(
              image: "assets/images/intro3.png",
              text: "Reading the Quran",
              description: "Read, and your Lord is the Most Generous",
            )),
        PageViewModel(
            titleWidget: Image.asset("assets/images/logo.png"),
            bodyWidget: CustomWidgetOnboard(
              image: "assets/images/intro4.png",
              text: "Bearish",
              description: "Praise the name of your Lord, \nthe Most High",
            )),
        PageViewModel(
            titleWidget: Image.asset("assets/images/logo.png"),
            bodyWidget: CustomWidgetOnboard(
              image: "assets/images/intro5.png",
              text: "Holy Quran Radio",
              description:
                  "You can listen to the Holy Quran Radio \nthrough the application for free and easily",
            )),
      ],
      onDone: () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
      onSkip: () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
      // showSkipButton: true,
      showBackButton: true,
      //skip: Text("Skip", style: TextStyle(color: Color(0xffE2BE7F))),
      back: Text("Back", style: AppStyles.bold16Primary),
      next: Text("Next", style: AppStyles.bold16Primary),
      done: Text("Done", style: AppStyles.bold16Primary),
      dotsDecorator: DotsDecorator(
        size: Size(7.0, 7.0),
        color: Color(0xff707070),
        activeColor: Color(0xffE2BE7F),
        activeSize: Size(18.0, 7.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(27.0),
        ),
      ),
    );
  }
}
