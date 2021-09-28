import 'package:azcourses/bloc/model/class_visdeo_model.dart';

class ClassModel{
  int id;
  String image;
  String intro;
  int points;
  String description;
  String title;
  int videoCount;
  int mintues;
  int allow;
  List<ClassVideoModel> classVideoModels;


  ClassModel({this.id, this.image, this.intro, this.points, this.description,
    this.title, this.videoCount, this.mintues,this.classVideoModels});

  ClassModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'] ?? "";
    print("my imaaaaage is $image - ${json['image']}");
    intro = json['intro'] ??null;
    description = json['description'] ?? "";
    title = json['name'] ?? "";
    points = json['points'] ?? 0;
    videoCount = json['videos_number'] ?? 0;
    mintues = json['mintues'] ?? 0;
    allow = json['allow'] ?? 0;
    classVideoModels = List<ClassVideoModel>();
    if (json['class_videos '] != null) {
      json['class_videos '].forEach((v) {
        classVideoModels.add(new ClassVideoModel.fromJson(v));
      });
    }
  }
}

