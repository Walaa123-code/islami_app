import 'package:flutter/material.dart';

import '../../../on_boarding/screen/first_onboard_page.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash_screen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  @override
  void initState() {
    super.initState(); // TODO: implement initState
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, OnBoardingScreen.routeName);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash_screen.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
