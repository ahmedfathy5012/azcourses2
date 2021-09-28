class ClassVideoModel{
  int id;
  String videoUrl;
  String image;
  String subject;
  String description;
  String pdf;
  String name;
  int allow;
  int isFree;
  String board;
  int mintues;
  ClassVideoModel({this.id, this.videoUrl, this.image, this.subject,
    this.description, this.pdf, this.name, this.allow,this.isFree,this.mintues});

  ClassVideoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'] ?? "";
    videoUrl = json['video_url'] !=null ? json['video_url'].toString().replaceAll(" ", "20%"):null;
    subject = json['subject'] ?? "";
    description = json['description'] ?? "";
    pdf = json['pdf'] ?? "";
    board = json['blackboard'] ?? "";
    name = json['name'] ?? "";
    allow = json['allow'] ??0;
    isFree = json['is_free'] ??0;
    mintues = json['mintues'] ??0;
  }
}