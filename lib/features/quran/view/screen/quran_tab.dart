import 'package:flutter/material.dart';
import 'package:islami_n/features/quran/model/sura_model.dart';
import 'package:islami_n/features/quran/view/widget/sura_details_screen.dart';
import 'package:islami_n/features/quran/view/widget/sura_list_widget.dart';
import 'package:islami_n/utils/app_colors.dart';
import 'package:islami_n/utils/app_style.dart';
import 'package:islami_n/utils/assets_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranTab extends StatefulWidget {
  static const String routeName = 'quran';

  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  void addSuraList() {
    // هتملالي الليست بتاع السيرش
    for (int i = 0; i < 114; i++) {
      SuraModel.suraList.add(SuraModel(
          fileName: '${i + 1}.txt',
          suraEnglishName: SuraModel.suraEnglishList[i],
          suraArabicName: SuraModel.suraArabicList[i],
          numOfVerses: SuraModel.suraNumberOfVerses[i]));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addSuraList();
    loadLastSura(); // get data in shared preference
  }

  String searchText = '';
  List<SuraModel> filterList = SuraModel.suraList;
  Map<String, String> loadSuraList = {};

/*
suraList => 114
filterList => 114 => result
suraList => filter => searchText => filterList
 */
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Image.asset(
            AssetsManager.quranBg,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // SizedBox(
                //   height: height * 0.02,
                // ),
                Image.asset(AssetsManager.logo),
                TextField(
                  style: TextStyle(color: AppColors.whiteColor),
                  cursorColor: AppColors.primaryDark,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: AppColors.primaryDark,
                            width: 1.5,
                          )),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: AppColors.primaryDark,
                          width: 1.5,
                        ),
                      ),
                      prefixIcon: Image.asset(
                        'assets/images/prefix_icon.png',
                        color: AppColors.primaryDark,
                      ),
                      hintText: 'Sura Name',
                      hintStyle: AppStyles.bold16White
                      // const TextStyle(color: AppColors.whiteColor)
                      ),
                  onChanged: (text) {
                    searchText = text;
                    filterList = SuraModel.suraList.where((suraModel) {
                      return suraModel.suraArabicName.contains(searchText) ||
                          suraModel.suraEnglishName
                              .toLowerCase()
                              .contains(searchText.toLowerCase());
                    }).toList();
                    setState(() {});
                  },
                ),
                SizedBox(height: height * 0.02),
                searchText.isNotEmpty ? SizedBox() : builtMostRecentlyWidget(),
                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Suras List',
                      style: AppStyles.bold16White,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: height * 0.01, horizontal: width * 0.01),
                        child: Divider(
                          thickness: 1.5,
                          endIndent: 30.5,
                          indent: 30.5,
                          color: AppColors.whiteColor,
                        ),
                      );
                    },
                    padding: EdgeInsets.zero,
                    itemCount: filterList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            // save last sura
                            saveLastSura(
                                suraEnName: filterList[index].suraEnglishName,
                                suraArName: filterList[index].suraArabicName,
                                numOfVerses: filterList[index].numOfVerses);
                            Navigator.of(context).pushNamed(
                                SuraDetailsScreen.routeName,
                                arguments: filterList[index]);
                          },
                          child: SuraListWidget(
                            suraModel: filterList[index],
                            index: index,
                          ));
                    },
                  ),
                ),
                SizedBox(height: height * 0.01),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget builtMostRecentlyWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Most Recently',
              style: AppStyles.bold16White,
              textAlign: TextAlign.left,
            ),
          ],
        ),
        SizedBox(height: 10),
        InkWell(
          onTap: () {
            // إنشاء SuraModel من البيانات المخزنة
            SuraModel lastSura = SuraModel(
              fileName:
                  '${getSuraFileName(loadSuraList['suraEnName'] ?? '')}.txt',
              suraEnglishName: loadSuraList['suraEnName'] ?? '',
              suraArabicName: loadSuraList['suraArName'] ?? '',
              numOfVerses: loadSuraList['numOfVerses'] ?? '',
            );

            Navigator.of(context).pushNamed(
              SuraDetailsScreen.routeName,
              arguments: lastSura,
            );
          },
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.primaryDark,
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loadSuraList['suraEnName'] ?? '',
                      style: AppStyles.bold23Black,
                    ),
                    Text(
                      loadSuraList['suraArName'] ?? '',
                      style: AppStyles.bold23Black,
                    ),
                    Text(
                      '${loadSuraList['numOfVerses'] ?? ''} Verses',
                      style: AppStyles.bold14Black,
                    ),
                  ],
                ),
                Image.asset(AssetsManager.mostRecently)
              ],
            ),
          ),
        ),
      ],
    );
  }

  String getSuraFileName(String suraEnglishName) {
    int index = SuraModel.suraEnglishList.indexOf(suraEnglishName);
    if (index != -1) {
      return '${index + 1}';
    } else {
      return '1'; // افتراضي سورة الفاتحة
    }
  }

  saveLastSura(
      {required String suraEnName,
      required String suraArName,
      required String numOfVerses}) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('suraEnName', suraEnName);
    await preferences.setString('suraArName', suraArName);
    await preferences.setString('numOfVerses', numOfVerses);
    await loadLastSura(); // reload after prefs
  }

  getLastSura() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String suraEnName = preferences.getString('suraEnName') ?? '';
    String suraArName = preferences.getString('suraArName') ?? '';
    String numOfVerses = preferences.getString('numOfVerses') ?? '';
    return {
      'suraEnName': suraEnName,
      'suraArName': suraArName,
      'numOfVerses': numOfVerses
    };
  }

// get data from shared prefs
  loadLastSura() async {
    loadSuraList = await getLastSura();
    setState(() {});
  }
}
