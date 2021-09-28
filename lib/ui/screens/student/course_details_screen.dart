import 'package:azcourses/ui/widgets/better_player.dart';
import 'package:azcourses/use_test_screen.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/model/course.dart';
import 'package:azcourses/bloc/model/video_model.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/circle_icon.dart';
import 'package:azcourses/ui/widgets/global/video_details_sheet.dart';
import 'package:azcourses/utils/constants.dart';
// import 'package:video_player/video_player.dart';

import '../../../utils/constants.dart';
import '../../../utils/constants.dart';
import 'full_video.dart';

class CourseDetailsScreen extends StatefulWidget {
  Course course;

  CourseDetailsScreen({this.course});

  @override
  _CourseDetailsScreenState createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
//  double sliderValue = 0;
//
//  int videoState; // 0 for initate 1 for puse 2 for last 3 for play
//
//  VideoPlayerController _controller;
//  Future<void> _initializeVideoPlayerFuture;
//  int _playPackTime = 0;
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    _controller = VideoPlayerController.network(
//      widget.videoModel.url,
//    );
//    _initializeVideoPlayerFuture = _controller.initialize();
//    videoState = 0;
//    _controller.addListener(() {
//      setState(() {
//        _playPackTime = _controller.value.position.inSeconds;
//      });
//    });
//    super.initState();
//  }
//
//  @override
//  void dispose() {
//    // Ensure disposing of the VideoPlayerController to free up resources.
//    _controller.dispose();
//    super.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    //
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: MAINCOLOR,
        body: Column(
          children: [
            // FullVideo(
            //     videoUrl: widget.course.intro,
            //     ),
            // BetterPlayer.network(
            //   "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
            //   betterPlayerConfiguration: BetterPlayerConfiguration(
            //     aspectRatio: 16 / 9,
            //   ),
            // ),
            BetterPlayerWidget(
              videoUrl: widget.course.intro??null,
            ),
            Expanded(
              child: CourseDetailsSheet(
                course: widget.course,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
