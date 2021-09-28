import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/new_app/bloc/model/discussion_reply.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/ui/widgets/global/icon_with_title.dart';
import 'package:azcourses/ui/widgets/global/person_row.dart';
import 'package:azcourses/ui/widgets/global/tag_widget.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:azcourses/utils/image_network.dart';
import 'package:flutter/material.dart';

class ReplyWidget extends StatelessWidget {
  final DiscussionReply reply;


  ReplyWidget({this.reply});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child:  Padding(
        padding:  EdgeInsets.symmetric(
            horizontal: ScreenHelper.screenWidth(context,16)
        ),
        child: Column(
          children: [
            PersonRow(
              title: reply.userName,
              image: reply.userImage,
              time: reply.time,
            ),
            SizedBox(
              height: ScreenHelper.screenHeight(context,14),
            ),
            Row(
              children: [
                Container(
                  width: ScreenHelper.screenWidth(context, 330),
                  child: CustomText(
                    text:reply.reply,
                    color: MAINBlack,
                    fontW: FW.regular,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ScreenHelper.screenHeight(context,24),
            ),
            reply.image == null || reply.image.isEmpty ?
            SizedBox():
            Container(
              height: ScreenHelper.screenHeight(context,134),
              width: ScreenHelper.screenWidth(context,343),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ScreenHelper.screenWidth(context,4)),
              ),
              child: ImageNetwork(
                url:reply.image,
                height: ScreenHelper.screenHeight(context,134),
                width: ScreenHelper.screenWidth(context,343),
              ),
            ),
            SizedBox(
              height: ScreenHelper.screenHeight(context,16),
            ),
          ],
        ),
      ),
    );
  }


}
