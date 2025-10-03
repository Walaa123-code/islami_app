import 'package:flutter/material.dart';

import '../../../../utils/app_style.dart';

class HadithContent extends StatelessWidget {
  String content;

  HadithContent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: height * 0.04),
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.02,
      ),
      child: Text(content,
          textAlign: TextAlign.center, style: AppStyles.medium22Primary),
    );
  }
}
