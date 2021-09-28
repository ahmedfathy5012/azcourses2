import 'package:azcourses/ui/widgets/better_player.dart';
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

class ClassScreen extends StatefulWidget {
  ClassModel classModel;
  Course course;
  List<ClassModel> classModels;
  int classIndex;
  int videoPlayerIndex;
  ClassVideoModel classVideoModel;
  String videoTitle;

  ClassScreen({this.classVideoModel,this.classModel,this.course,this.classModels,this.classIndex=0,this.videoPlayerIndex=-1,this.videoTitle});


  @override
  _ClassScreenState createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
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
            //   videoUrl: widget.classVideoModel!=null?widget.classVideoModel.videoUrl:widget.classModel.intro,
            //     ),
            // (widget.classVideoModel!=null?widget.classVideoModel.videoUrl??null:widget.classModel.intro??null)==null?
            // Text("kdjflsd"):
            BetterPlayerWidget(
              videoUrl:
              // (widget.classVideoModel==null&&widget.classModel.intro==null)?null:widget.classVideoModel!=null?widget.classVideoModel.videoUrl??null:widget.classModel.intro??null,
              widget.classVideoModel!=null?widget.classVideoModel.videoUrl??null:widget.classModel.intro??null,
            ),
            Expanded(
              child: ClassDetailsSheet(
                     classModel: widget.classModel,
                     course: widget.course,
                     classModels: widget.classModels,
                classIndex: widget.classIndex??0,
                videoPlayerIndex: widget.videoPlayerIndex,
                videoTitle: widget.videoTitle??null,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
