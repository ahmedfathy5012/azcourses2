class Offer {
  int id;
  String image;

  Offer({this.id, this.image});

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image']??" ";
  }
}
