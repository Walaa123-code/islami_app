import 'package:flutter/material.dart';
import 'package:islami_n/utils/app_style.dart';

import '../../utils/assets_manager.dart';

class SebhaTab extends StatefulWidget {
  static const String routeName = "sebha_screen";

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int _counter = 0;
  int index = 0;
  List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'لا اله الا الله',
    'الله اكبر',
    'لا حول ولا قوة الا بالله'
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AssetsManager.hadithBg,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AssetsManager.logo),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
                  style: AppStyles.bold36White,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height * 0.04),
                Center(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        _counter++;
                        if (_counter == 33) {
                          _counter = 0;
                          index++;
                        }
                        if (index == azkar.length) {
                          index = 0;
                        }
                      });
                    },
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            children: [
                              SizedBox(height: height * 0.09),
                              Text(azkar[index], style: AppStyles.bold36White),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Text('$_counter', style: AppStyles.bold36White),
                            ],
                          ),
                          Image.asset(
                            AssetsManager.sebha,
                            width: width * 0.8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
