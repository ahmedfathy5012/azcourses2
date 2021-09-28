
import 'package:azcourses/new_app/bloc/model/group.dart';
import 'package:azcourses/new_app/bloc/model/live_lesson.dart';
import 'package:azcourses/new_app/features/groupsFeature/bloc/repo/my_group_repository.dart';
import 'package:azcourses/new_app/features/liveSessions/bloc/repo/my_live_lessons_repository.dart';
import 'package:azcourses/ui/widgets/global/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MyLiveLessonsController extends GetxController{


  final int groupId;


  MyLiveLessonsController({this.groupId});

  List<LiveLesson> lessons = [];
   bool isLoading = false;
  LiveLessonsRepository _liveLessonsRepository = LiveLessonsRepository();
  Future<void> fetchLiveLessons() async {
      isLoading = true;
      update();
    var response = await _liveLessonsRepository.fetchLiveLessons(groupId: groupId??null);

    if (response.statusCode == 200 && response.data["status"] == true) {
      print("request operation success");
      lessons.clear();
      for (var item in response.data['data']) {
        lessons.add(LiveLesson.fromJson(item));
      }
      print("convert operation success");
      isLoading = false;
      update();
    } else {
      print("operation failed");
      isLoading = false;
      update();
    }

  }

  @override
  void onInit() {
    super.onInit();
    fetchLiveLessons();
  }

}