import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_n/features/provider/radio_provider.dart';
import 'package:islami_n/utils/app_colors.dart';
import 'package:islami_n/utils/app_style.dart';
import 'package:islami_n/utils/assets_manager.dart';
import 'package:provider/provider.dart';

import '../../model/Reciters_model.dart';

class RecitersWidget extends StatefulWidget {
  final Reciters model;

  const RecitersWidget({super.key, required this.model});

  @override
  State<RecitersWidget> createState() => _RecitersWidgetState();
}

class _RecitersWidgetState extends State<RecitersWidget> {
  String? url;
  bool isMuted = true;

  @override
  void initState() {
    // TODO: implement initState
    getUrl();

    super.initState();
  }

  void getUrl() {
    url = "${widget.model.moshaf![0].server}112.mp3";
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RadioProvider>(
      builder: (context, RadioProvider provider, child) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.primaryDark,
                image: DecorationImage(
                    // alignment: Alignment.bottomCenter,
                    image: AssetImage(
                      AssetsManager.reciterSound,
                    ),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.model.name!,
                  style: AppStyles.bold20Black,
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          provider.play(url!);
                          // print(widget.model.url!);
                        },
                        icon: Icon(
                          provider.currentPlayingUrl == url &&
                                  provider.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow_sharp,
                          size: 35,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        onPressed: () {
                          if (provider.currentPlayingUrl == url) {
                            provider.stop();
                          }
                        },
                        icon: Icon(
                          Icons.stop_rounded,
                          size: 35,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        onPressed: () {
                          isMuted = !isMuted;
                          setState(() {});
                          provider.setVolume(isMuted ? 0.2 : 0.0);
                        },
                        icon: Icon(
                          isMuted
                              ? CupertinoIcons.volume_up
                              : CupertinoIcons.volume_off,
                          size: 35,
                        )),
                    SizedBox(
                      width: 10,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../utils/app_colors.dart';
// import '../../../../utils/app_style.dart';
// import '../../../../utils/assets_manager.dart';
// import '../../model/radio_model.dart';
//
// class RadioWidget extends StatelessWidget {
//   final Radios model;
//
//   const RadioWidget({super.key, required this.model});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: 130,
//         width: double.infinity,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: AppColors.primaryDark,),
//         child: Stack(children: [
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: ClipRRect(
//               borderRadius: const BorderRadius.vertical(
//                 bottom: Radius.circular(20),
//               ),
//               child: Image.asset(
//                 AssetsManager.radioSound,
//                 width: double.infinity,
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
//           Column(
//            // crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//               model.name.toString(),
//               style: AppStyles.bold20Black,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.play_arrow_sharp,
//                       size: 30,
//                     )),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.stop_rounded,
//                       size: 30,
//                     )),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       CupertinoIcons.volume_up,
//                       size: 30,
//                     )),
//                 SizedBox(
//                   width: 10,
//                 )
//             ],
//           )
//         ],),
//         ]
//       ))
//
//     );
//   }
// }
