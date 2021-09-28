class NotificationModel{
  String title;
  String subtitle;

  NotificationModel({this.title, this.subtitle});

  NotificationModel.fromJson(Map<String , dynamic> jsonObject){
    title = jsonObject['title']??"";
    subtitle = jsonObject['body']??"";
  }
}