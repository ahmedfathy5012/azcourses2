class VideoModel {
  int id;
  String url;
  String year;
  String subject;
  String teacher;
  int teacherid;
  int subjectId;
  String description;
  String image;
  String type;
  String supType;
  int typeId;
  int supTypeId;

  VideoModel({
    this.image,
    this.id,
    this.url,
    this.year,
    this.subject,
    this.teacher,
    this.teacherid,
    this.subjectId,
    this.description,
    this.supTypeId,
    this.typeId,
    this.type,
    this.supType,
  });

  VideoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['url'] != null) url = json['url'];
    if (json['year'] != null) year = json['year'];
    if (json['subject'] != null) subject = json['subject'];
    if (json['teacher'] != null) teacher = json['teacher'];
    if (json['teacherid'] != null) teacherid = json['teacherid'];
    if (json['subject_id'] != null) subjectId = json['subject_id'];
    if (json['description'] != null) description = json['description'];
    if (json['image'] != null) image = json['image'];

    if (json['suptypeid'] != null) supTypeId = json['suptypeid'];
    if (json['typeid'] != null) typeId = json['typeid'];
    if (json['suptype'] != null) supType = json['suptype'];
    if (json['type'] != null) type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['year'] = this.year;
    data['subject'] = this.subject;
    data['teacher'] = this.teacher;
    data['teacherid'] = this.teacherid;
    data['description'] = this.description;
    return data;
  }
}
