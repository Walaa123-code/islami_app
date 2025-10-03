import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_n/features/quran/model/sura_model.dart';
import 'package:islami_n/utils/app_colors.dart';
import 'package:islami_n/utils/app_style.dart';
import 'package:islami_n/utils/assets_manager.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details';

  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadSuraFile(args.fileName);
    }
    if (verses.isEmpty) {
      buildSuraContent();
    }
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primaryDark, size: 25),
        // backgroundColor: AppColors.blackColor,
        toolbarHeight: height * 0.08,
        title: Text(
          args.suraArabicName,
          style: AppStyles.bold25Primary,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image.asset(
            AssetsManager.coverContent,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Center(
            child: Column(
              children: [
                SizedBox(height: height * 0.05),
                Text(
                  "ﹺﹸﹺﹸبِسْـمِ اللهِ الرَّحْمٰـنِ الرَّحِيـمِﹺﹸﹺﹸ",
                  style: AppStyles.bold24Primary,
                ),
                SizedBox(height: height * 0.03),
                Expanded(
                  child: verses.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryDark,
                          ),
                        )
                      : SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.05,
                            // vertical: height * 0.02
                          ),
                          child: Text(
                            buildSuraContent(),
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.justify,
                            style: AppStyles.medium22Primary,
                          ),
                        ),
                  //  : ListView.builder(
                  //     itemBuilder: (context, index) {
                  //       return SuraContent(
                  //         content: verses[index],
                  //         index: index,
                  //       );
                  //     },
                  //     itemCount: verses.length,
                  //   ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  String buildSuraContent() {
    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < verses.length; i++) {
      buffer.write("(${i + 1}) ${verses[i]} ");
    }
    return buffer.toString().trim();
  }

  void loadSuraFile(String fileName) async {
    String suraContent =
        await rootBundle.loadString("assets/files/quran/$fileName");
    List<String> suraLines = suraContent.split("\n");
    verses = suraLines;
    setState(() {});
  }
}
