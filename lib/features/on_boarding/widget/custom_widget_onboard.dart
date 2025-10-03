import 'package:flutter/cupertino.dart';

import '../../../utils/app_style.dart';

class CustomWidgetOnboard extends StatelessWidget {
  final String image;
  final String text;
  final String? description;

  const CustomWidgetOnboard({
    super.key,
    required this.image,
    required this.text,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: height * 0.40,
          fit: BoxFit.contain,
        ),
        SizedBox(height: height * 0.03),
        Text(
          text,
          textAlign: TextAlign.center,
          style: AppStyles.bold24Primary,
        ),
        SizedBox(height: height * 0.02),
        if (description != null)
          Text(
            description!,
            textAlign: TextAlign.center,
            style: AppStyles.bold18Primary,
          ),
      ],
    );
  }
}
