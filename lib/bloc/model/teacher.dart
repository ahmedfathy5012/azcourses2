import 'video_model.dart';
import 'video_model.dart';
import 'video_model.dart';

class Teacher {
  int id;
  List<VideoModel> videos;
  String subject;
  String years;
  String address;
  double latitude;
  double longitude;
  String name;
  String description;

  Teacher({
    this.id,
    this.videos,
    this.subject,
    this.years,
    this.address,
    this.latitude,
    this.longitude,
    this.name,
    this.description,
  });

  Teacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['video'] != null) if (json['video'] != null) {
      videos = new List<VideoModel>();
      json['video'].forEach((v) {
        videos.add(new VideoModel.fromJson(v));
      });
    }
    if (json['subject'] != null) subject = json['subject'];
    if (json['years'] != null) years = json['years'];
    if (json['address'] != null) address = json['address'];
    if (json['latitude'] != null) latitude = json['latitude'];
    if (json['longitude'] != null) longitude = json['longitude'];
    if (json['name'] != null) name = json['name'];
    if (json['description'] != null) description = json['description'];
  }
}
