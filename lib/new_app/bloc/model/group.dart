class Group {

  int id;
  String title;
  String course;
  String subject;
  String lecturerName;
  String lecturerImage;
  int subscribers;
  List<GroupDate> dates;

  Group.fromJson(Map<String , dynamic> map){
    this.id =            map['id']??0;
    this.title =         map['title']??'';
    this.course =        map['course']??'';
    this.subject =       map['subject']??'';
    this.subscribers =   map['number_of_students']??'';
    this.lecturerName =  map['lect_name']??'';
    this.lecturerImage = map['lect_image']??'';
    this.dates =   [];
    setGroupDates(map);
  }

  void setGroupDates(Map<String , dynamic> map){
    if (map['dates'] != null) {
      map['dates'].forEach((v) {
        dates.add(GroupDate.fromJson(v));
      });
    }
  }
}

class GroupDate{
  int id;
  String day;
  String fromTime;
  String toTime;

  GroupDate.fromJson(Map<String , dynamic> map){
    this.id = map['id']??0;
    this.day = map['day']??'';
    this.fromTime = map['from_time']??'';
    this.toTime = map['to_time']??'';
  }
}