
import 'package:azcourses/new_app/bloc/model/group.dart';
import 'package:azcourses/new_app/bloc/model/subject.dart';
import 'package:azcourses/new_app/features/groupsFeature/bloc/repo/my_group_repository.dart';
import 'package:azcourses/new_app/features/libraryFeature/bloc/repo/subject_repository.dart';
import 'package:azcourses/ui/widgets/global/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SubjectsController extends GetxController{
  List<Subject> subjects = [];
   bool isLoading = false;
  SubjectsRepository _subjectsRepository = SubjectsRepository();
  Future<void> fetchsubjects() async {
      isLoading = true;
      update();
    var response = await _subjectsRepository.fetchSubjects();
    if (response.statusCode == 200 && response.data["status"] == true) {
      print("request operation success");
      subjects.clear();
      for (var item in response.data['data']) {
        subjects.add(Subject.fromJson(item));
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
    fetchsubjects();
  }

}