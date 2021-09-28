import 'package:azcourses/bloc/model/select_model.dart';

class PrimaryStageModel extends SelectModel{
  int id;
  String title;
  List lists;

  PrimaryStageModel({
    this.id, this.title, this.lists
  });

  PrimaryStageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['level'];
    lists = new List<PrimaryYear>();
    if (json['year'] != null) {
      json['year'].forEach((v) {
        lists.add(new PrimaryYear.fromJson(v));
      });
    }
  }
}

class PrimaryYear extends SelectModel{
  int id;
  String title;
  List lists;

  PrimaryYear({
    this.id, this.title, this.lists
  });

  PrimaryYear.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['name_ar'];
    // lists = new List<level>();
    // if (json['year'] != null) {
    //   json['year'].forEach((v) {
    //     lists.add(new VideoModel.fromJson(v));
    //   });
    // }
  }
}

// class PrimaryYear{
//   int id;
//   String title;
//   List lists;
//
//   PrimaryYear({
//     this.id, this.title, this.lists
//   });
//
//   PrimaryYear.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['name'];
//     lists = new List<level>();
//     if (json['year'] != null) {
//       json['year'].forEach((v) {
//         lists.add(new VideoModel.fromJson(v));
//       });
//     }
//   }
// }

