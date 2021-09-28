class Tag{
  int id;
  String title;

  Tag({this.id, this.title});

  Tag.fromJson(Map<String , dynamic> map){
    this.id = map['id']??0;
    this.title = map['title']??'';
  }
}