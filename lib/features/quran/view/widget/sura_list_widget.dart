import 'package:flutter/material.dart';
import 'package:islami_n/features/quran/model/sura_model.dart';

import '../../../../utils/app_style.dart';
import '../../../../utils/assets_manager.dart';

class SuraListWidget extends StatelessWidget {
  SuraModel suraModel;
  int index;

  SuraListWidget({super.key, required this.suraModel, required this.index});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AssetsManager.vector),
            Text(
              textAlign: TextAlign.center,
              "${index + 1}",
              style: AppStyles.bold16White,
            ),
          ],
        ),
        SizedBox(
          width: width * 0.03,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(suraModel.suraEnglishName, style: AppStyles.bold20White),
                  SizedBox(height: height * 0.01),
                  Text(
                    "${suraModel.numOfVerses} Verses",
                    style: AppStyles.bold14White,
                  ),
                ],
              ),
            ],
          ),
        ),
        Text(
          suraModel.suraArabicName,
          style: AppStyles.bold20White,
        )
      ],
    );
  }
}
