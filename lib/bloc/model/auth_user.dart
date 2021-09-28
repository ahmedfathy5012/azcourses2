class AuthUser {
  int id;
  String userName;
  String gradeNumber;
  String phone;
  String email;
  String password;
  String state;
  String city;
  String address;
  String apiToken;
  String deviceToken;
  double latitude;
  double longitude;
  int isStudent;
  String description;
  String image;
  String code;

  String isPrimary;


  String universityId;
  String universityTitle;
  String collegeId;
  String collegeTitle;
  String departmentId;
  String departmentTitle;
  String collegeYearId;
  String collegeYearTitle;

  String primaryStageId;
  String primaryStageTitle;
  String primaryYearId;
  String primaryYearTitle;

  String isSientefic;


  AuthUser(
  {
    this.id,
    this.userName,
    this.gradeNumber,
    this.phone,
    this.email,
    this.password,
    this.state,
    this.city,
    this.address,
    this.apiToken,
    this.deviceToken,
    this.latitude,
    this.longitude,
    this.isStudent=1,
    this.description,
    this.image,
    this.code,
    this.isPrimary,
    this.universityId,
    this.universityTitle,
    this.collegeId,
    this.collegeTitle,
    this.departmentId,
    this.departmentTitle,
    this.collegeYearId,
    this.collegeYearTitle,
    this.primaryStageId,
    this.primaryStageTitle,
    this.primaryYearId,
    this.primaryYearTitle,
    this.isSientefic
});

  AuthUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['user_name'] != null) userName = json['user_name'];
    if (json['email'] != null) email = json['email'];
    if (json['phone'] != null) phone = json['phone'];
    if (json['state'] != null) state = json['state'];
    if (json['city'] != null) city = json['city'];
    if (json['address'] != null) address = json['address'];
    if (json['latitude'] != null)
      latitude = double.parse(json['latitude'].toString());
    if (json['longitude'] != null)
      longitude = double.parse(json['longitude'].toString());
    if (json['is_student'] != null) isStudent = json['is_student'];
    if (json['image'] != null) image = json['image'];
    if (json['description'] != null) description = json['description'];
    if (json['api_token'] != null) apiToken = json['api_token'];
    if (json['code'] != null) code = json['code'];
  }
}
