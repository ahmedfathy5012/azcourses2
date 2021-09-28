class StateLocation{
  int id;
  String title;
  List<CityLocation> cityLocation;

  StateLocation({this.id, this.title});


  StateLocation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if(json['state']!=null)
      title = json['state'];
    if (json['city'] != null) {
      cityLocation = new List<CityLocation>();
      json['city'].forEach((v) {
        cityLocation.add(CityLocation.fromJson(v));
      });
    }

  }

}


class CityLocation{
  int id;
  String title;

  CityLocation({this.id, this.title});


  CityLocation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if(json['city']!=null)
      title = json['city'];
  }

}

