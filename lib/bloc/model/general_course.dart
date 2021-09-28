class GeneralCourse {
  int id;
  String icon;
  String title;


  GeneralCourse({this.id, this.icon, this.title});

  GeneralCourse.fromJson(Map<String , dynamic> jsonObject){
    this.id = jsonObject['id'];
    this.icon = jsonObject['image']??"";
    this.title = jsonObject['title']??"";

  }
}