class Exam {
  int id;
  String title;
  String subject;
  String lecturerName;
  String dateDay;
  int questionNumber;
  int degree;
  int duration;
  String from;
  String to;
  String description;


  Exam(
  {this.id,
    this.title,
    this.subject,
    this.lecturerName,
    this.dateDay,
    this.questionNumber,
    this.degree,
    this.duration,
    this.from,
    this.to,
    this.description});

  Exam.fromJson(Map<String,dynamic> map){
    this.id = map['id']??0;
    this.title = map['title']??'';
    this.subject = map['subject']??'';
    this.lecturerName = map['lecturer_name']??'';
    this.dateDay = map['date_day']??'';
    this.questionNumber = map['question_number']??0;
    this.degree = map['degree']??0;
    this.duration = map['duration']??0;
    this.from = map['from']??'';
    this.description = map['description']??'';
    this.to = map['to']??'';
  }
}