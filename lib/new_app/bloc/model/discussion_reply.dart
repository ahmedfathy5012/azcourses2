class DiscussionReply{
  int id;
  String reply;
  String userName;
  String userImage;
  String image;
  String time;

  DiscussionReply({this.id, this.reply, this.userName, this.userImage,
    this.image, this.time});

  DiscussionReply.fromJson(Map<String,dynamic> map){
    this.id = map['id']??0;
    this.reply = map['reply']??'';
    this.userName = map['userName']??'';
    this.userImage = map['userImage']??'';
    this.image = map['image']??'';
    this.time = map['time']??'';
  }
}