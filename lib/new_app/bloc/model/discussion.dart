

import 'package:azcourses/new_app/bloc/model/discussion_reply.dart';
import 'package:azcourses/new_app/bloc/model/tag.dart';

class Discussion{
  int id;
  String content;
  String userName;
  String userImage;
  String image;
  String time;

  List<Tag> tags;
  List<DiscussionReply> replies;

  Discussion({this.id, this.content, this.userName, this.userImage, this.image,
    this.time, this.tags, this.replies});


  Discussion.fromJson(Map<String,dynamic> map){
    this.id = map['id']??0;
    this.content = map['content']??'';
    this.userName = map['userName']??'';
    this.userImage = map['userImage']??'';
    this.image = map['image']??'';
    this.time = map['time']??'';
    setTags(map);
    setReplies(map);
  }

  void setTags(Map<String , dynamic> map){
    this.tags = [];
    if (map['tags'] != null) {
      map['tags'].forEach((v) {
        tags.add(Tag.fromJson(v));
      });
    }
  }

  void setReplies(Map<String , dynamic> map){
    this.replies = [];
    if (map['replies'] != null) {
      map['replies'].forEach((v) {
        replies.add(DiscussionReply.fromJson(v));
      });
    }
  }

}