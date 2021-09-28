import 'package:azcourses/bloc/model/course.dart';
import 'package:azcourses/bloc/model/video_model.dart';

import 'lecturer.dart';

class Category {
  int id;
  String name;
  List<Course> recentlyCourses=[];
  List<Course> courses=[];
  List<Lecturer> lecturers=[];
  List<Course> generalCourses=[];

  Category({this.id, this.name, this.recentlyCourses, this.courses,this.lecturers,this.generalCourses});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['title'];
    courses = new List<Course>();
    if (json['courses'] != null) {
      json['courses'].forEach((v) {
        courses.add(new Course.fromJson(v));
      });
    }
    recentlyCourses = new List<Course>();
    if (json['latest_courses'] != null) {
      json['latest_courses'].forEach((v) {
        recentlyCourses.add(new Course.fromJson(v));
      });
    }

    lecturers = new List<Lecturer>();
    if (json['lectuers'] != null) {
      json['lectuers'].forEach((v) {
        lecturers.add(new Lecturer.fromJson(v));
      });
    }

    generalCourses = new List<Course>();
    if (json['courses'] != null) {
      json['courses'].forEach((v) {
        generalCourses.add(new Course.fromJson(v));
      });
    }
  }
}
