import 'package:flutter/material.dart';


class BackGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: double.infinity,
      width: double.infinity,
      child: Image(
        image: AssetImage("assets/images/splash.png"),
        fit: BoxFit.cover,
      ),
    );
  }
}
