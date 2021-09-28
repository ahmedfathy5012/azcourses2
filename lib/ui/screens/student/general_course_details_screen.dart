import 'package:azcourses/ui/widgets/better_player.dart';
import 'package:azcourses/ui/widgets/global/general_class_details_sheet.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/model/class_model.dart';
import 'package:azcourses/bloc/model/class_visdeo_model.dart';
import 'package:azcourses/bloc/model/course.dart';
import 'package:azcourses/bloc/model/video_model.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/circle_icon.dart';
import 'package:azcourses/ui/widgets/global/class_details_sheet.dart';
import 'package:azcourses/ui/widgets/global/video_details_sheet.dart';
import 'package:azcourses/utils/constants.dart';
// import 'package:video_player/video_player.dart';

import '../../../utils/constants.dart';
import '../../../utils/constants.dart';
import 'full_video.dart';

class GeneralCourseDetailsScreen extends StatefulWidget {
  ClassModel classModel;
  Course course;
  String courseIntro;
  int videoIndex;
  int videoPlayerIndex;
  ClassVideoModel classVideoModel;

  GeneralCourseDetailsScreen({this.courseIntro,this.classVideoModel,this.classModel,this.course,this.videoPlayerIndex=-1,this.videoIndex});


  @override
  _GeneralCourseDetailsScreenState createState() => _GeneralCourseDetailsScreenState();
}

class _GeneralCourseDetailsScreenState extends State<GeneralCourseDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    //
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: MAINCOLOR,
        body: Column(
          children: [
            BetterPlayerWidget(
              videoUrl: widget.courseIntro??widget.classVideoModel.videoUrl,
            ),
            Expanded(
              child: GeneralClassDetailsSheet(
                     classModel: widget.classModel,
                     course: widget.course,
                     // classModels: widget.classModels,
                     // classIndex: widget.classIndex??0,
                     videoPlayerIndex: widget.videoPlayerIndex,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
