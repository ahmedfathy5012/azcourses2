class Paper{
  int id;
  String paper;
  int lessonId;
  int allow;
  int points;
  String link;

  Paper({this.id, this.paper, this.lessonId, this.allow, this.points, this.link});

  Paper.fromJson(Map<String ,dynamic> map){
    this.id = map['id']??0;
    this.paper = map['paper']??'';
    this.link = map['link']??'';
    this.allow = map['allow']??0;
    this.points = map['points']??0;
  }
}