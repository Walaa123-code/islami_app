import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_n/utils/app_colors.dart';
import 'package:islami_n/utils/app_style.dart';
import 'package:islami_n/utils/assets_manager.dart';
import 'package:provider/provider.dart';

import '../../../providers/radio_provider.dart';
import '../../data/radio_model.dart';

class RadioWidget extends StatefulWidget {
  final Radios model;

  const RadioWidget({super.key, required this.model});

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  bool isMuted = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Consumer<RadioProvider>(
      builder: (context, RadioProvider provider, child) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.01),
          child: Container(
            height: height * 0.15,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.primaryDark,
                image: DecorationImage(

                    // alignment: Alignment.bottomCenter,
                    image: AssetImage(
                      AssetsManager.reciterSound,
                    ),
                    fit: BoxFit.fill)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.model.name.toString(),
                  style: AppStyles.bold20Black,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          provider.play(widget.model.url!);
                          // print(widget.model.url!);
                        },
                        icon: Icon(
                          provider.currentPlayingUrl == widget.model.url &&
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
                          if (provider.currentPlayingUrl == widget.model.url) {
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
                      width: width * 0.01,
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
