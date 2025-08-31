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
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AssetsManager.logo),
                //  const SizedBox(height: 5),
                Text(
                  'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
                  style: AppStyles.bold36White,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
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
                              SizedBox(height: 90),
                              Text(azkar[index], style: AppStyles.bold36White),
                              SizedBox(
                                height: 10,
                              ),
                              Text('$_counter', style: AppStyles.bold36White),
                            ],
                          ),
                          //  SizedBox(height: 20),
                          Image.asset(
                            AssetsManager.sebha,
                            width: 320,
                            // fit: BoxFit.fitWidth,
                          ),
                          // SizedBox(height: 5),
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
//   Scaffold(
//  // backgroundColor: Colors.transparent,
//   body:  Container(
//     decoration: const BoxDecoration(
//      // color: AppColors.blackColor,
//         image: DecorationImage(
//             image: AssetImage(AssetsManager.sebhaBg), fit: BoxFit.cover)),
//     child: InkWell(
//       autofocus: false,
//       hoverColor: AppColors.whiteColor,
//       focusColor: AppColors.whiteColor,
//       highlightColor: AppColors.whiteColor,
//       splashColor: Colors.transparent,
//       onTap: () {
//         setState(() => turns += 1 / 33);
//         _counter++;
//         if (_counter == 33) {
//           _counter = 0;
//           index++;
//         }
//
//         if (_counter == 33) {
//           _counter = 0;
//           index++;
//         }
//         if (index == azkar.length) {
//           index = 0;
//         }
//       },
//       child: Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(AssetsManager.logo),
//             SizedBox(height: 20),
//             const Text(
//               'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
//               style: TextStyle(
//                   fontSize: 35,
//                   fontWeight: FontWeight.w900,
//                   color: AppColors.whiteColor),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Center(
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         azkar[index],
//                         style: const TextStyle(
//                             color: AppColors.whiteColor,
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         '$_counter',
//                         style: const TextStyle(
//                             color: AppColors.whiteColor,
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                   AnimatedRotation(
//                       turns: turns,
//                       duration: const Duration(milliseconds: 50),
//                       child: Image.asset(
//                        AssetsManager.sebha,
//                         fit: BoxFit.fitWidth,
//                         centerSlice: Rect.zero,
//                       )),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   ),
// );
//   }
// }
