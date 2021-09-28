import 'package:azcourses/bloc/model/select_model.dart';

class YearModel extends SelectModel{
  int id;
  String title;

  YearModel({this.id, this.title});

  YearModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['year'] != null) title = json['year'];
  }
}
