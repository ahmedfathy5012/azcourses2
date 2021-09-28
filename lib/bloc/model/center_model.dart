class CenterModel{
  int id;
  String name;
  String phone;
  String image;
  String description;
  String address;
  int visitors;
  String code;
  String printSplash;

  CenterModel({this.printSplash,this.id, this.name, this.image, this.description, this.address,this.phone, this.visitors , this.code});

  CenterModel.fromJson(Map<String,dynamic> jsonObject){
    this.id = jsonObject['id'];
    this.name = jsonObject['name']??"";
    this.image = jsonObject['image']??"";
    this.description = jsonObject['description']??"";
    this.address = jsonObject['address']??"";
    this.code = jsonObject['code']??"";
    this.visitors = jsonObject['visitors']??0;
    this.printSplash = jsonObject['printsplash']??"";
  }
}