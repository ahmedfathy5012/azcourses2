import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/new_app/bloc/model/discussion.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/ui/widgets/global/icon_with_title.dart';
import 'package:azcourses/ui/widgets/global/person_row.dart';
import 'package:azcourses/ui/widgets/global/tag_widget.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:azcourses/utils/image_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'discussion_replies_sheet.dart';

class DiscussionItem extends StatelessWidget {
  final Discussion discussion;


  DiscussionItem({this.discussion});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: Column(
        children: [
        Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: ScreenHelper.screenWidth(context,16)
          ),
          child: Column(
            children: [
              PersonRow(),
              SizedBox(
                height: ScreenHelper.screenHeight(context,14),
              ),
              Row(
                children: [
                  Container(
                    width: ScreenHelper.screenWidth(context, 330),
                    child: CustomText(
                      text:discussion.content,
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
              discussion.image == null || discussion.image.isEmpty ?
              SizedBox():
              Container(
                height: ScreenHelper.screenHeight(context,134),
                width: ScreenHelper.screenWidth(context,343),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ScreenHelper.screenWidth(context,4)),
                ),
                child: ImageNetwork(
                  url: discussion.image,
                  height: ScreenHelper.screenHeight(context,134),
                  width: ScreenHelper.screenWidth(context,343),
                ),
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context,24),
              ),
            ],
          ),
        ),
          Container(
            height: ScreenHelper.screenHeight(context,28),
            width: double.infinity,
            child: ListView.separated(
                itemBuilder: (context, index) => Padding(
                  padding:  EdgeInsets.only(
                    right: ScreenHelper.screenWidth(context, index==0 ? 16 : 0)
                  ),
                  child: TagWidget(tag: discussion.tags[index],),
                ),
                separatorBuilder: (context, index) => SizedBox(width: ScreenHelper.screenWidth(context, 8),),
                itemCount: discussion.tags.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: ScreenHelper.screenHeight(context,0),
          ),
          Divider(),
          SizedBox(
            height: ScreenHelper.screenHeight(context,5),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: ScreenHelper.screenWidth(context, 16)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconWithTitle(
                  onTap: (){
                    Get.bottomSheet(DiscussionRepliesSheet(
                      discussion: discussion,
                    ),
                        ignoreSafeArea: true,
                        isScrollControlled: true,
                        enableDrag: true,isDismissible: true
                    );
                  },
                  title: '${discussion.replies.length} رد',
                  icon: '15.png',
                ),
                IconWithTitle(
                  onTap: (){
                    Get.bottomSheet(DiscussionRepliesSheet(
                      discussion: discussion,
                    ),
                        ignoreSafeArea: true,
                        isScrollControlled: true,
                        enableDrag: true,isDismissible: true
                    );
                  },
                  title: 'إضافة رد',
                  icon: '15.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



  Widget userHeader({BuildContext context}){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
       Container(
         height: ScreenHelper.screenHeight(context, 44),
         width: ScreenHelper.screenHeight(context, 44),
         clipBehavior: Clip.hardEdge,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(40),
         ),
         child: ImageNetwork(
           height: ScreenHelper.screenHeight(context, 44),
           width: ScreenHelper.screenHeight(context, 44),
           url: discussion.userImage,
         ),
       ),
        SizedBox(
          width: ScreenHelper.screenWidth(context,8),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: discussion.userName,
              fontSize: 15,
              color: MAINBlack,
              fontW: FW.bold,
            ),
            SizedBox(
              height: ScreenHelper.screenHeight(context, 2),
            ),
            CustomText(
              text: discussion.time,
              fontSize: 11,
              color: DISABLENAVBARCOLOR,
              fontW: FW.light,
            ),
          ],
        ),
        Spacer(),
        GestureDetector(
          onTap: (){
            print('pressed');
          },
          child: Container(
            color: Colors.transparent,
            width: ScreenHelper.screenHeight(context,18),
            height: ScreenHelper.screenHeight(context,18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 Column(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     CircleAvatar(
                       backgroundColor: Color(0xffB0B0B0),
                       radius: ScreenHelper.screenHeight(context, 2),
                     ),
                     CircleAvatar(
                       backgroundColor: Color(0xffB0B0B0),
                       radius: ScreenHelper.screenHeight(context, 2),
                     ),
                     CircleAvatar(
                       backgroundColor: Color(0xffB0B0B0),
                       radius: ScreenHelper.screenHeight(context, 2),
                     ),
                   ],
                 ),
              ],
            ),
          ),
        ),
      ],
    );
  }

}
