import 'package:azcourses/bloc/model/select_model.dart';

class CollectorStageModel extends SelectModel{
  int id;
  String title;
  List collegeLists;

  CollectorStageModel({
    this.id, this.title, this.collegeLists
  });

  CollectorStageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    collegeLists = new List<CollectorCollege>();
    if (json['college'] != null) {
      json['college'].forEach((v) {
        collegeLists.add(new CollectorCollege.fromJson(v));
      });
    }
  }
}

class CollectorCollege extends SelectModel{
  int id;
  String title;
  List sectionsList;

  CollectorCollege({
    this.id, this.title, this.sectionsList
  });

  CollectorCollege.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    sectionsList = new List<CollectorSection>();
    if (json['sections'] != null) {
      json['sections'].forEach((v) {
        sectionsList.add(new CollectorSection.fromJson(v));
      });
    }
  }
}

class CollectorSection extends SelectModel{
  int id;
  String title;
  List yearList;

  CollectorSection({
    this.id, this.title, this.yearList
  });

  CollectorSection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    yearList = new List<CollectorYear>();
    if (json['years'] != null) {
      json['years'].forEach((v) {
        yearList.add(new CollectorYear.fromJson(v));
      });
    }
  }
}

class CollectorYear extends SelectModel{
  int id;
  String title;


  CollectorYear({
    this.id, this.title
  });

  CollectorYear.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }
}

