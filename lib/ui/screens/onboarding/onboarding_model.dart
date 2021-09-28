import 'package:flutter/material.dart';

class OnBoardingModel {
  int id;
  String image;
  String title;
  String subtitle;

  OnBoardingModel({this.id, this.image, this.title, this.subtitle});
}

List<OnBoardingModel> onBoardingLists = [
      OnBoardingModel(
      id: 0,
      title: "مرحبا بك من جديد\nفي تطبيق زي كورسات",
      subtitle:
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد",
      image: "assets/images/tab00.png"),
  OnBoardingModel(
      id: 1,
      title: "أدخل الكود الخاص بالمنصة\nالتي تود الاشتراك بها",
      subtitle:
      "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد",
      image: "assets/images/tab01.png"),
  OnBoardingModel(
      id: 2,
      title: "تابع كل الكورسات الخاصة\nبمجالك  بسهولة في اي مكان",
      subtitle:
      "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد",
      image: "assets/images/tab02.png"),
  OnBoardingModel(
      id: 3,
      title: "كن على القمة دائما معنا و\nحقق النجاح في امان",
      subtitle:
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد",
      image: "assets/images/tab03.png"),
];
