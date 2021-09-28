
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/new_app/features/libraryFeature/ui/widgets/subject_grid.dart';
import 'package:azcourses/new_app/features/libraryFeature/ui/widgets/subject_item.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/ui/widgets/new_widgets/sheet_header.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';

class SubjectsSheet extends StatelessWidget {
  final Function onTap;


  SubjectsSheet({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: ScreenHelper.screenHeight(context,790),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft:  Radius.circular(ScreenHelper.screenHeight(context,31)),
            topRight: Radius.circular(ScreenHelper.screenHeight(context,31))
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: ScreenHelper.screenHeight(context,16),
            ),
            SheetHeader(),
            SizedBox(
              height: ScreenHelper.screenHeight(context,10),
            ),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: ScreenHelper.screenWidth(context,16)
                ),
                child: SubjectGrid(
                  onTap: onTap!=null?(id){
                    onTap(id);
                  }:(){

                  },
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
