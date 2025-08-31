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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height:
              MediaQuery.of(context).size.height * 0.40, // 45% من الشاشة للصورة
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 40),
        Text(
          text,
          textAlign: TextAlign.center,
          style: AppStyles.bold24Primary,
        ),
        const SizedBox(height: 30),
        if (description != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              description!,
              textAlign: TextAlign.center,
              style: AppStyles.bold20Primary,
            ),
          ),
      ],
    );
  }
}
