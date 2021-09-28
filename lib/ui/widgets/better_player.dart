import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';





class BetterPlayerWidget extends StatefulWidget {
  final String videoUrl;

  BetterPlayerWidget({this.videoUrl});

  @override
  _BetterPlayerWidgetState createState() => _BetterPlayerWidgetState();
}

class _BetterPlayerWidgetState extends State<BetterPlayerWidget> {
  BetterPlayerController _betterPlayerController;
  double animateHeight = 100;
  double animateWidth = 100;
  Timer timer;

   int animateStatus=0;



  void setTimer(){
    timer = Timer.periodic(Duration(seconds: 10), (Timer t) {
      setState(() {
        if(animateStatus>4){
          animateStatus=0;
        }else{
          animateStatus++;
        }
      //   if (animateWidth >=600) {
      //     animateWidth = 100;
      //   } else {
      //     animateWidth += 100;
      //   }
        if (animateHeight >=150) {
          animateHeight = 0;
        } else {
          animateHeight+=30;
        }
      });
    });
  }

  Alignment animateAlign(){
    switch(animateStatus){
      case 0:
        return Alignment.center;
      break;
      case 1:
        return Alignment.topRight;
      break;
      case 2:
        return Alignment.topLeft;
      break;
      case 3:
        return Alignment.centerLeft;
      break;
      case 4:
        return Alignment.centerRight;
      break;
      default:
        return Alignment.center;
    }
  }

  GetStorage box = GetStorage();
  String phone="";

  @override
  void initState() {
    super.initState();
    phone = box.read("phone")??"";
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        // "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
        widget.videoUrl??" "
    );
    _betterPlayerController = BetterPlayerController(
        BetterPlayerConfiguration(
          aspectRatio: 16 / 9,
          showPlaceholderUntilPlay: true,
          // autoPlay: true,
          placeholder: Container(
            color: Colors.white
          ),
          errorBuilder: (context, errorMessage) => Text(errorMessage,style: TextStyle(color: Colors.red),),
        ),
        betterPlayerDataSource: betterPlayerDataSource);

    setTimer();
  }
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return
      widget.videoUrl!=null?
      Stack(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: BetterPlayer(
              controller: _betterPlayerController,
            ),
          ),
        ),
        // WavyAnimatedTextKit(
    //       Padding(
    //
    //         padding:  EdgeInsets.only(
    //           top: ScreenHelper.screenHeight(context,animateHeight)
    //         ),
    //         child: Align(
    //           alignment: animateAlign(),
    //           // alignment:Alignment.center,
    //           child: Text(
    //             phone,
    //     style: Theme.of(context).textTheme.headline3.copyWith(
    //     color: MAINCOLOR,
    //     fontSize: ScreenHelper.screenFont(context, 15)),
    //     // text: [
    //     //  phone,
    //     // ],
    //     // isRepeatingAnimation: true,
    //     // speed: Duration(milliseconds: 200),
    // ),
    //         ),
    //       ),
      ],
    ):
      AspectRatio(
        aspectRatio: 16 / 9,
        child:Image.asset(
          "assets/icons/defaultcourse.png",
          fit: BoxFit.cover,
        ),
      );
  }
}
