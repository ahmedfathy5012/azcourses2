

class LiveLesson {
  int id;
  String title;
  String day;
  String hour;
  String lecturerName;


  LiveLesson({this.id, this.title, this.day, this.hour, this.lecturerName});

  LiveLesson.fromJson(Map<String , dynamic> map){
    this.id = map['id']??0;
    this.title = map['title']??'';
    this.day = map['day']??'';
    this.hour = map['hour']??'';
    this.lecturerName = map['lecturer_name']??'';
  }
}