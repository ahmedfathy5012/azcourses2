
import 'package:azcourses/new_app/bloc/model/exam.dart';
import 'package:azcourses/new_app/bloc/model/group.dart';
import 'package:azcourses/new_app/features/examsFeature/bloc/repo/my_current_exams_repository.dart';
import 'package:azcourses/new_app/features/examsFeature/bloc/repo/my_new_exams_repository.dart';
import 'package:azcourses/new_app/features/groupsFeature/bloc/repo/my_group_repository.dart';
import 'package:azcourses/ui/widgets/global/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MyCurrentExamsController extends GetxController{
  List<Exam> exams = [];
  bool isLoading = false;
  MyCurrentExamsRepository _currentExamsRepository = MyCurrentExamsRepository();
  Future<void> fetchMyCurrentExams() async {
      isLoading = true;
      update();
    var response = await _currentExamsRepository.fetchMyCurrentExams();

    if (response.statusCode == 200 && response.data["status"] == true) {
      print("request operation success");
      exams.clear();
      for (var item in response.data['data']) {
        exams.add(Exam.fromJson(item));
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
    fetchMyCurrentExams();
  }

}