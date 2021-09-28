import 'package:azcourses/new_app/features/discussionsFeature/bloc/controller/fetch_discussions_controller.dart';
import 'package:azcourses/new_app/features/discussionsFeature/ui/widgets/discussion_item.dart';
import 'package:azcourses/new_app/features/discussionsFeature/ui/widgets/discussion_replies_sheet.dart';
import 'package:azcourses/new_app/ui/widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/back_bar.dart';
import 'package:azcourses/ui/widgets/global/header_back_ground.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class DiscussionsScreen extends StatelessWidget {

  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    FetchDiscussionsController _fetchDiscussionController = Get.put(FetchDiscussionsController());
    return Scaffold(
      backgroundColor: MAINCOLOR,
      floatingActionButton: FloatingActionButton(
        backgroundColor: MAINCOLOR,
        onPressed: (){
         // Get.bottomSheet(DiscussionRepliesSheet(),
         //     ignoreSafeArea: true,
         //     isScrollControlled: true,
         //     enableDrag: true,isDismissible: true
         // );
        },
        child: Image.asset(
          'assets/icons/editinfo.png',
          color: Colors.white,
          height: ScreenHelper.screenHeight(context, 24),
        ),
      ),
      body: Stack(
        children: [
          HeaderBackGround(),
          BackBar(
            title: "نقاشات عامة",
          ),
          Column(
            children: [
              Container(
                  width: double.infinity,
                  height: ScreenHelper.screenHeight(context, 100)
              ),
              Expanded(
                child: GetBuilder<FetchDiscussionsController>(
                  builder: (_) =>  Container(
                    width: double.infinity,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                                ScreenHelper.screenRadius(context, 30)),
                            topRight: Radius.circular(
                                ScreenHelper.screenRadius(context, 30)))),
                    child:
                    _.isLoading?
                        SizedBox(height: 0,):
                    _.discussions.isEmpty?
                    EmptyWidget(
                      image: 'nodissc.png',
                      title: 'لا يوجد مناقشات بعد',
                      subtitle: "لا يوجد مناقشات حاليا , قم بإضافة مناقشة جديدة",
                    ):
                   Padding(
                     padding:  EdgeInsets.only(
                       top: ScreenHelper.screenHeight(context,16)
                     ),
                     child: ListView.separated(
                         itemBuilder: (context, index) => Padding(
                           padding:  EdgeInsets.only(
                             bottom:ScreenHelper.screenHeight(context,index==_.discussions.length-1 ?100:0)
                           ),
                           child: DiscussionItem(discussion: _.discussions[index],),
                         ),
                         separatorBuilder: (context, index) => Padding(
                           padding:  EdgeInsets.symmetric(
                             vertical: ScreenHelper.screenHeight(context,10)
                           ),
                           child: Container(
                             width: double.infinity,
                             height: ScreenHelper.screenHeight(context, 8),
                             color: Color(0xffF3F3F3),
                           ),
                         ),
                         itemCount: _.discussions.length
                     ),
                   ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
