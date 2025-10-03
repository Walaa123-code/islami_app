import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_n/utils/app_colors.dart';
import 'package:islami_n/utils/app_style.dart';

class NextPrayWidget extends StatefulWidget {
  Duration timeRemaining;
  final void Function() getPrayingData;
  final void Function() playAdan;
  final void Function() stopAdan;

  NextPrayWidget(
      {super.key,
      required this.timeRemaining,
      required this.getPrayingData,
      required this.playAdan,
      required this.stopAdan});

  @override
  State<NextPrayWidget> createState() => _NextPrayWidgetState();
}

class _NextPrayWidgetState extends State<NextPrayWidget> {
  late Timer timer;
  bool isMuted = false;

  @override
  void initState() {
    // TODO: implement initState
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (widget.timeRemaining.inSeconds > 0) {
          widget.timeRemaining -= Duration(seconds: 1);
        } else {
          timer.cancel();
          widget.getPrayingData;
          widget.playAdan;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }

  String formatDuration(Duration duration) {
    String hours = duration.inHours.toString().padLeft(2, "0");
    String minutes =
        duration.inMinutes.remainder(60).toString().padLeft(2, "0");
    String seconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, "0");
    return "$hours:$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.06, top: height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Next Pray ",
            style: AppStyles.bold16BlackOp,
          ),
          Text(
            " ${formatDuration(widget.timeRemaining)}",
            style: AppStyles.bold16Black,
          ),
          SizedBox(
            width: width * 0.01,
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  isMuted = !isMuted;
                  if (isMuted) {
                    widget.stopAdan();
                  }
                });
              },
              icon: Icon(
                isMuted ? CupertinoIcons.volume_off : Icons.volume_up,
                color: AppColors.blackColor,
              ))
        ],
      ),
    );
  }
}
