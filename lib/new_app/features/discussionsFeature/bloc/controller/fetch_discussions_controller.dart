
import 'package:azcourses/new_app/bloc/model/discussion.dart';
import 'package:azcourses/new_app/bloc/model/exam.dart';
import 'package:azcourses/new_app/bloc/model/group.dart';
import 'package:azcourses/new_app/features/discussionsFeature/bloc/repo/fetch_discussions_repository.dart';
import 'package:azcourses/new_app/features/examsFeature/bloc/repo/my_current_exams_repository.dart';
import 'package:azcourses/new_app/features/examsFeature/bloc/repo/my_new_exams_repository.dart';
import 'package:azcourses/new_app/features/groupsFeature/bloc/repo/my_group_repository.dart';
import 'package:azcourses/ui/widgets/global/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FetchDiscussionsController extends GetxController{
  List<Discussion> discussions = [];
  bool isLoading = false;
  FetchDiscussionsRepository _fetchDiscussionsRepository = FetchDiscussionsRepository();
  Future<void> fetchDiscussions() async {
      isLoading = true;
      update();
    var response = await _fetchDiscussionsRepository.fetchDiscussionsExams();

    if (response.statusCode == 200 && response.data["status"] == true) {
      print("request operation success");
      discussions.clear();
      for (var item in response.data['data']) {
        discussions.add(Discussion.fromJson(item));
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
    fetchDiscussions();
  }

}