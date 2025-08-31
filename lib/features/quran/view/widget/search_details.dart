import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class SearchDetails extends StatelessWidget {
  static const String routeName = 'search_details';

  const SearchDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'assets/images/quran_bg.png',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Container(
            margin: EdgeInsets.all(12),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                  ),
                  TextField(
                    style: TextStyle(color: AppColors.primaryDark),
                    cursorColor: AppColors.primaryDark,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: AppColors.primaryDark,
                              width: 1,
                            )),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: AppColors.primaryDark,
                            width: 1,
                          ),
                        ),
                        prefixIcon: Image.asset(
                          'assets/images/prefix_icon.png',
                          color: AppColors.primaryDark,
                        ),
                        hintText: 'Sura Name',
                        hintStyle:
                            const TextStyle(color: AppColors.whiteColor)),
                  )
                ]))
      ]),
    );
  }
}
