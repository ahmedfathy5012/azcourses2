class Lecturer {
  int id;
  String name;
  String subjects;
  String subject;
  String followToName;
  String followToTitle;
  String image;
  String years;
  String desription;

  Lecturer({
    this.id, this.name, this.subjects,this.subject, this.followToName, this.followToTitle,this.image,this.years,this.desription
  });

  Lecturer.fromJson(Map<String , dynamic> jsonObject){
    this.id = jsonObject['id'];
    this.name = jsonObject['name']??" ";
    this.image = jsonObject['image']??" ";
    this.subjects = jsonObject['subjects']??" ";
    this.subject = jsonObject['subject']??" ";
    this.years = jsonObject['years']??" ";
    this.desription = jsonObject['decription']??" ";
  }
}