import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/assets_manager.dart';

class QuranBenefit extends StatelessWidget {
  static const String routeName = 'benefit';

  const QuranBenefit({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      // appBar: AppBar(
      //   iconTheme: IconThemeData(color: AppColors.primaryDark),
      //   backgroundColor: AppColors.blackColor,
      //   toolbarHeight: 30,
      //   // title: Padding(
      //   //   padding: const EdgeInsets.only(left: 10.0),
      //   //   child: Text(
      //   //     'دعاء ختم القران الكريم',
      //   //     style: AppStyles.bold25Primary,
      //   //   ),
      //   // ),
      // ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Stack(
          children: [
            Image.asset(
              AssetsManager.coverContent,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            // SafeArea(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Align(
            //       alignment: Alignment.topRight, // أو topLeft حسب الاتجاه
            //       child: IconButton(
            //         icon: Icon(
            //           Icons.arrow_back,
            //           color: AppColors.primaryDark,
            //           size: 30,
            //         ),
            //         onPressed: () {
            //           Navigator.pop(context);
            //         },
            //       ),
            //     ),
            //   ),
            // ),
            Column(
              children: [
                SizedBox(height: height * 0.04),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: height * 0.02),
                          child: Text(
                            "فَضْلُ قِرَاءَةِ القُرْآنِ الكَرِيمِ",
                            textAlign: TextAlign.center,
                            style: AppStyles.bold24Primary,
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              """عن أبي أمامة رضي الله عنه ، قال : سمعت رسول الله صلى الله عليه وسلم ، يقول : (( اقرؤوا القرآن ؛ فإنه يأتي يوم القيامة شفيعاً لأصحابه )) رواه مسلم .

عن النَّوَّاس بن سَمْعان رضي الله عنه ، قال : سمعت رسول الله صلى الله عليه وسلم ، يقول : (( يؤتى يوم القيامة بالقرآن وأهله الذين كانوا يعملون به في الدنيا ، تقدُّمُه سورة البقرة وآل عمران ، تُحَاجَّان عن صاحبهما )) رواه مسلم .

عن عثمان بن عفان رضي الله عنه ، قال : قال رسول الله صلى الله عليه وسلم : (( خيركم من تعلَّم القرآن وعلَّمه )) رواه البخاري .

عن عائشة رضي الله عنها ، قالت : قال رسول الله صلى الله عليه وسلم : (( الذي يقرأ القرآن وهو ماهر به ، مع السفرة الكرام البررة ، والذي يقرأ القرآن ويتتعتع فيه وهو عليه شاق ، له أجران )) متفق عليه .

عن أبي موسى الأشعري رضي الله عنه ، قال : قال رسول الله صلى الله عليه وسلم : (( مثل المؤمن الذي يقرأ القرآن مثل الأُتْرُجَّة : ريحها طيب وطعمها طيب ، ومثل المؤمن الذي لا يقرأ القرآن كمثل التمرة : لا ريح لها وطعمها حُلْو ، ومثل المنافق الذي يقرأ القرآن كمثل الريحانة : ريحها طيب وطعمها مرّ ، ومثل المنافق الذي لا يقرأ القرآن كمثل الحنظلة : ليس لها ريح وطعمها مرّ )) متفق عليه .

عن عمر بن الخطاب رضي الله عنه : أن النبي صلى الله عليه وسلم ، قال : (( إن الله يرفع بهذا الكتاب أقواماً ويضع به آخرين )) رواه مسلم .

عن ابن عمر رضي الله عنهما ، عن النبي صلى الله عليه وسلم ، قال : (( لا حسد إلا في اثنتين : رجل آتاه الله القرآن ، فهو يقوم به آناء الليل وآناء النهار ، ورجل آتاه الله مالاً ، فهو ينفقه آناء الليل وآناء النهار )) متفق عليه .
(الآناء : الساعات)

عن البراء بن عازب رضي الله عنهما ، قال : كان رجل يقرأ سورة الكهف ، وعنده فرس مربوط بشطنين ، فتغشته سحابة ، فجعلت تدنو ، وجعل فرسه ينفر منها ، فلما أصبح أتى النبي صلى الله عليه وسلم فذكر ذلك له ، فقال : (( تلك السكينة تنزلت للقرآن )) متفق عليه .
(الشَّطَن بفتح الشين المعجمة والطاء المهملة : الحبل)

عن ابن مسعود رضي الله عنه ، قال : قال رسول الله صلى الله عليه وسلم : (( من قرأ حرفاً من كتاب الله فله به حسنة ، والحسنة بعشر أمثالها ، لا أقول : ألم حرف ، ولكن : ألف حرف ، ولام حرف ، وميم حرف )) رواه الترمذي ، وقال : حديث حسن صحيح .

عن ابن عباس رضي الله عنهما ، قال : قال رسول الله صلى الله عليه وسلم : (( إن الذي ليس في جوفه شيء من القرآن كالبيت الخَرِب )) رواه الترمذي ، وقال : حديث حسن صحيح .

عن عبد الله بن عمرو بن العاص رضي الله عنهما ، عن النبي صلى الله عليه وسلم ، قال : (( يقال لصاحب القرآن : اقرأ وارْتَقِ ورتِّلْ كما كنت ترتِّل في الدنيا ، فإن منزلك عند آخر آية تقرؤها )) رواه أبو داود والترمذي ، وقال : حديث حسن صحيح .

تم اختيار هذه الأحاديث من كتاب رياض الصالحين ، من الحديث رقم 991 إلى الحديث رقم 1001
  """,
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: AppStyles.medium22Primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
