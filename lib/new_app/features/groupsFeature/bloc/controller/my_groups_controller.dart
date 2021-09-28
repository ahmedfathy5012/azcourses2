
import 'package:azcourses/new_app/bloc/model/group.dart';
import 'package:azcourses/new_app/features/groupsFeature/bloc/repo/my_group_repository.dart';
import 'package:azcourses/ui/widgets/global/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MyGroupsController extends GetxController{
  List<Group> groups = [];
   bool isLoading = false;
  MyGroupsRepository _myGroupsRepository = MyGroupsRepository();
  Future<void> fetchMyGroups() async {
      isLoading = true;
      update();
    var response = await _myGroupsRepository.fetchMyGroups();

    if (response.statusCode == 200 && response.data["status"] == true) {
      print("request operation success");
      groups.clear();
      for (var item in response.data['data']) {
        groups.add(Group.fromJson(item));
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
    fetchMyGroups();
  }

}