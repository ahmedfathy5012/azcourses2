class CourseRate{
  int id;
  String comment;
  int rate;
  String studentName;
  String date;

  CourseRate({this.id, this.comment, this.rate, this.studentName, this.date});

  CourseRate.fromJson(Map<String,dynamic> jsonObject){
    this.id = jsonObject['id'];
    this.comment = jsonObject['comment']??"";
    this.rate = jsonObject['rate']??0;
    this.studentName = jsonObject['name']??"";
    this.date = jsonObject['date']??"";
  }
}