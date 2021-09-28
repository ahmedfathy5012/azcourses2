
import 'package:azcourses/new_app/bloc/model/group.dart';
import 'package:azcourses/new_app/bloc/model/paper.dart';
import 'package:azcourses/new_app/bloc/model/subject.dart';
import 'package:azcourses/new_app/features/groupsFeature/bloc/repo/my_group_repository.dart';
import 'package:azcourses/new_app/features/libraryFeature/bloc/repo/library_repository.dart';
import 'package:azcourses/new_app/features/libraryFeature/bloc/repo/subject_repository.dart';
import 'package:azcourses/ui/widgets/global/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LibraryController extends GetxController{
  List<Paper> papers = [];
   bool isLoading = false;
  LibraryRepository _libraryRepository = LibraryRepository();

  int subjectId;

  LibraryController({this.subjectId});

  Future<void> fetchLibrary() async {
      isLoading = true;
      update();
    var response = await _libraryRepository.fetchLibrary(subjectId: subjectId);
    if (response.statusCode == 200 && response.data["status"] == true) {
      print("request operation success");
      papers.clear();
      for (var item in response.data['data']) {
        papers.add(Paper.fromJson(item));
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
    fetchLibrary();
  }

}