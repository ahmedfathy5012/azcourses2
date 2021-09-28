import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/new_app/features/groupsFeature/bloc/controller/my_groups_controller.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'current_exam.dart';
import 'my_group.dart';
import 'online_group.dart';


class MyGroupSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyGroupsController _myGroupsController = Get.put(MyGroupsController());
    return  GetBuilder<MyGroupsController>(
      builder: (_) =>
          _.isLoading?
          SizedBox(height: 0,):
          Padding(
           padding:  EdgeInsets.symmetric(
            vertical: ScreenHelper.screenHeight(context,16)
           ),
           child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(
                  horizontal: ScreenHelper.screenWidth(context,16)
              ),
              child: CustomText(
                text: 'مجموعاتي',
                color: MAINBlack,
                fontW: FW.semibold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: ScreenHelper.screenHeight(context,16),
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context,16)),
                child: MyGroup(group: _.groups[index],),
              ),
              separatorBuilder: (context, index) => SizedBox(height: ScreenHelper.screenWidth(context,16),),
              itemCount: _.groups.length,
              shrinkWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
