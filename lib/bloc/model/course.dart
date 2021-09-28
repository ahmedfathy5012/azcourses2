import 'package:azcourses/bloc/model/class_visdeo_model.dart';

class Course {
  int id;
  String image;
  String intro;
  String lecturer_name;
  int lecturer_id;
  String lecturer_image;
  int points;

  String name;
  String subject;
  int mintues;
  String description;
  String centerName;
  String centerImage;
  int hours;
  String publichByName;
  String publichByImage;
  int rate;
  int isAllow;
  int categoryId;

  List<ClassVideoModel> classVideoModels;

  Course({
    this.lecturer_image,this.classVideoModels,
    this.id,this.categoryId, this.image, this.intro, this.lecturer_name, this.lecturer_id,this.description,this.isAllow,this.rate,
    this.points, this.name, this.subject,this.mintues,this.centerImage,this.centerName,this.hours,this.publichByImage,this.publichByName
  });

  Course.fromJson(Map<String , dynamic> jsonObject){
    this.id = jsonObject['id'];
    this.image = jsonObject['image']??"";
    this.intro = jsonObject['intro']??null;
    this.lecturer_name = jsonObject['lecturer']??"";
    this.lecturer_id = jsonObject['lecturer_id']??null;
    this.lecturer_image = jsonObject['lecturer_image']??"test.png";
    this.points = jsonObject['points']??0;
    this.description = jsonObject['description']??"";
    this.name = jsonObject['name']??"";
    this.subject = jsonObject['subject']??"";
    this.publichByImage = jsonObject['posted_by_image']??"";
    this.publichByName = jsonObject['posted_by']??"";
    this.rate = jsonObject['rate']!=null?jsonObject['rate'].toInt():0;
    // this.rate = 0;
    this.isAllow = jsonObject['allow']??0;
    this.mintues = jsonObject['mintues']??0;
    this.categoryId = jsonObject['category_id']??0;

    classVideoModels = new List<ClassVideoModel>();
    if (jsonObject['videos '] != null) {
      print("video adding");

      jsonObject['videos '].forEach((v) {
        classVideoModels.add(new ClassVideoModel.fromJson(v));
      });
    }
  }
}