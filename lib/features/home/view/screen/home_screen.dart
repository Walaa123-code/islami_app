import 'package:flutter/material.dart';
import 'package:islami_n/features/home/drawer/item/drawer_item.dart';
import 'package:islami_n/utils/app_colors.dart';

import '../../../hadith/view/screen/hadith_tab.dart';
import '../../../quran/view/screen/quran_tab.dart';
import '../../../radio/view/screen/radio_tab.dart';
import '../../../sebha/sebha_tab.dart';
import '../../../time/view/screen/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _TestState();
}

class _TestState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> screen = [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab()
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: DrawerItem(),
        bottomNavigationBar: Theme(
            data:
                Theme.of(context).copyWith(canvasColor: AppColors.primaryDark),
            child: BottomNavigationBar(
                elevation: 5,
                selectedItemColor: AppColors.whiteColor,
                unselectedItemColor: AppColors.blackColor,
                currentIndex: currentIndex,
                onTap: (index) {
                  currentIndex = index;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                      icon:
                          ImageIcon(AssetImage("assets/images/quran_icon.png")),
                      label: "Quran"),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                          AssetImage("assets/images/hadith_icon.png")),
                      label: "Hadith"),
                  BottomNavigationBarItem(
                      icon:
                          ImageIcon(AssetImage("assets/images/sebha_icon.png")),
                      label: "Sebha"),
                  BottomNavigationBarItem(
                      icon:
                          ImageIcon(AssetImage("assets/images/radio_icon.png")),
                      label: "Radio"),
                  BottomNavigationBarItem(
                      icon:
                          ImageIcon(AssetImage("assets/images/time_icon.png")),
                      label: "Time"),
                ])),
        body: Stack(
          children: [
            screen[currentIndex],
            Positioned(
              top: 30,
              left: 10,
              child: IconButton(
                icon: const Icon(Icons.menu,
                    size: 28, color: AppColors.whiteColor),
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
              ),
            )
          ],
        ));
  }
}
