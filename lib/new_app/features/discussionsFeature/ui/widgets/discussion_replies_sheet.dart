import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/new_app/bloc/model/discussion.dart';
import 'package:azcourses/new_app/features/discussionsFeature/ui/widgets/reply_widget.dart';
import 'package:azcourses/ui/widgets/global/sheet_header.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscussionRepliesSheet extends StatelessWidget {
  final Discussion discussion;


  DiscussionRepliesSheet({this.discussion});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: ScreenHelper.screenHeight(context,700),
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(ScreenHelper.screenHeight(context,31)),
              topRight: Radius.circular(ScreenHelper.screenHeight(context,31)),
          )
        ),
        child: Stack(
          children: [
            Column(
              children: [
                SheetHeader(title: 'الردود',),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => ReplyWidget(
                        reply: discussion.replies[index],
                      ),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: discussion.replies.length,
                    shrinkWrap: true,
                  ),
                ),
                SizedBox(
                  height: ScreenHelper.screenHeight(context,61),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: ScreenHelper.screenHeight(context, 61),
                child: Column(
                  children: [
                    Divider(),
                    Expanded(
                      child: Padding(
                        padding:  EdgeInsets.symmetric(
                          horizontal: ScreenHelper.screenWidth(context,16)
                        ),
                        child: Container(
                          width: double.infinity,
                          height: ScreenHelper.screenHeight(context, 61),
                          child: Center(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: ScreenHelper.screenWidth(context,306),
                                      height: ScreenHelper.screenHeight(context,36),
                                      child: Stack(
                                        children: [
                                          Container(
                                           width: ScreenHelper.screenWidth(context,306),
                                           height: ScreenHelper.screenHeight(context,36),
                                            decoration: BoxDecoration(
                                              color: Color(0xffF7F6F6),
                                              borderRadius: BorderRadius.circular(ScreenHelper.screenHeight(context,30)),
                                              border: Border.all(width: 1,color: Color(0xffC4C4C4))
                                            ),
                                            child: Padding(
                                              padding:  EdgeInsets.symmetric(
                                                horizontal: ScreenHelper.screenWidth(context, 16)
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  TextFormField(
                                                    cursorColor: TAGCOLOR,
                                                    cursorHeight: ScreenHelper.screenHeight(context,10),
                                                    decoration: InputDecoration(
                                                     enabledBorder: InputBorder.none,
                                                      focusedBorder: InputBorder.none,
                                                      disabledBorder: InputBorder.none,
                                                      border: InputBorder.none,
                                                      errorBorder: InputBorder.none,

                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context,16)),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: GestureDetector(
                                                onTap: (){},
                                                child:Image.asset(
                                                  'assets/icons/editinfo.png',
                                                  color: TAGCOLOR,
                                                  height: ScreenHelper.screenHeight(context,20),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Get.back();
                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                        width: ScreenHelper.screenWidth(context,30),
                                        height: ScreenHelper.screenHeight(context,24),
                                        child: Icon(Icons.send,color: TAGCOLOR,size: ScreenHelper.screenHeight(context, 24),),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
