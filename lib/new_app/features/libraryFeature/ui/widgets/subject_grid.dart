import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/new_app/features/libraryFeature/bloc/controller/subjects_controller.dart';
import 'package:azcourses/new_app/features/libraryFeature/ui/widgets/subject_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SubjectGrid extends StatelessWidget {
  final Function onTap;


  SubjectGrid({this.onTap});

  @override
  Widget build(BuildContext context) {
    SubjectsController _subjectsController = Get.put(SubjectsController());
    return GetBuilder<SubjectsController>(
      builder: (_) =>
         _.isLoading?
         SizedBox(height: 0,):
         _.subjects.isEmpty?
         SizedBox(height: 0,):
          GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: ScreenHelper.screenWidth(context, 17),
            mainAxisSpacing: ScreenHelper.screenHeight(context, 17),
            childAspectRatio: 1
        ),
        itemBuilder: (context, index) => SubjectItem(
          subject: _.subjects[index],
          // onTap: onTap??(){},
          onTap: onTap!=null?(){
            onTap(_.subjects[index].id);
          }:(){},
        ),
        itemCount: _.subjects.length,
        shrinkWrap: true,
      ),
    );
  }
}
