class Subject{
  int id;
  String title;

  Subject({this.id, this.title});

  Subject.fromJson(Map<String , dynamic> map){
    this.id = map['id']??0;
    this.title = map['name']??'';
  }
}