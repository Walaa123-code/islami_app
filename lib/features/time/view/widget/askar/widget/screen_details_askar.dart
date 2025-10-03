import 'package:flutter/material.dart';
import 'package:islami_n/features/time/view/widget/askar/data/askar_model.dart';

import '../../../../../../utils/app_colors.dart';
import '../../../../../../utils/app_style.dart';
import '../../../../../../utils/assets_manager.dart';
import '../data/data.dart';

class ScreenDetailsAskar extends StatefulWidget {
  static const String routeName = 'duaa';

  final String type;

  const ScreenDetailsAskar({super.key, required this.type});

  @override
  State<ScreenDetailsAskar> createState() => _ScreenDetailsAskarState();
}

class _ScreenDetailsAskarState extends State<ScreenDetailsAskar> {
  late Future<AzkarModel> _futureAzkar;

  @override
  void initState() {
    super.initState();
    _futureAzkar = AzkarData.getAzkarData();
  }

  List<Zikr>? _getListByType(AzkarModel model) {
    switch (widget.type) {
      case "morning":
        return model.morning;
      case "evening":
        return model.evening;
      case "afterPrayer":
        return model.afterPrayer;
      case "tasbeeh":
        return model.tasbeeh;
      case "sleep":
        return model.sleep;
      case "wakeUp":
        return model.wakeUp;
      case "quran":
        return model.quranDuas;
      case "prophets":
        return model.prophetsDuas;
      default:
        return [];
    }
  }

  final titles = {
    "morning": "أذكار الصباح",
    "evening": "أذكار المساء",
    "afterPrayer": "أذكار بعد الصلاة",
    "tasbeeh": "تسابيح",
    "sleep": "أذكار النوم",
    "wakeUp": "أذكار الاستيقاظ",
    "quran": "أدعية قرآنية",
    "prophets": "أدعية الأنبياء",
  };

  String _getTitle() => titles[widget.type] ?? "أذكار";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: FutureBuilder<AzkarModel>(
        future: _futureAzkar,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primaryDark),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "something went wrong",
                    style: AppStyles.medium20White,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: height * 0.02),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryDark,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                    onPressed: () {
                      setState(() {
                        _futureAzkar = AzkarData.getAzkarData();
                      });
                    },
                    child: Text(
                      "Try again",
                      style: AppStyles.medium20White,
                    ),
                  ),
                ],
              ),
            );
          }

          final model = snapshot.data!;
          final azkarList = _getListByType(model) ?? [];

          if (azkarList.isEmpty) {
            return Center(
              child: Text(
                "Not Found",
                style: AppStyles.medium20White,
                textAlign: TextAlign.center,
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Stack(
              children: [
                Image.asset(
                  AssetsManager.coverContent,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
                Column(
                  children: [
                    SizedBox(height: height * 0.04),
                    Text(
                      _getTitle(),
                      style: AppStyles.bold28Primary,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: height * 0.03),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                        itemCount: azkarList.length,
                        itemBuilder: (context, index) {
                          final zikr = azkarList[index];
                          return Card(
                            color: AppColors.primaryDark.withOpacity(0.15),
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (zikr.content != null)
                                    Text(
                                      zikr.content!
                                          .replaceAll(r'\n', ' ')
                                          .replaceAll('\n', ' ')
                                          .replaceAll("'", '')
                                          .replaceAll('"', '')
                                          .replaceAll(',', ' ')
                                          .replaceAll(RegExp(r'\s+'), ' ')
                                          .trim(),
                                      textAlign: TextAlign.center,
                                      style: AppStyles.bold24Primary,
                                    ),
                                  // if (zikr.reference != null &&
                                  //     zikr.reference!.isNotEmpty) ...[
                                  //   SizedBox(height: height * 0.02),
                                  //   Text(
                                  //     " ${zikr.reference!}",
                                  //     style: AppStyles.bold16White,
                                  //     textAlign: TextAlign.center,
                                  //   ),
                                  // ],
                                  // if (zikr.count != null &&
                                  //     zikr.count!.isNotEmpty) ...[
                                  SizedBox(height: height * 0.01),
                                  Text(
                                    "التكرار: ${zikr.count}",
                                    style: AppStyles.bold18White,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
