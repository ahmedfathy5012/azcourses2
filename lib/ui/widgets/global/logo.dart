import 'package:flutter/material.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';



class Logo extends StatelessWidget {
  double size;

  Logo({this.size});

  @override
  Widget build(BuildContext context) {
    return SquareImageContainer(
      size: size,
      image: AssetImage("assets/reicons/logo 7.png"),
    );
  }
}
