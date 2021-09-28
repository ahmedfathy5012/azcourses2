import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import '../../widgets/global/soon_header.dart';

class SoonScreen extends StatefulWidget {
  bool isBack;

  SoonScreen({this.isBack = false});

  @override
  _SoonScreenState createState() => _SoonScreenState();
}

class _SoonScreenState extends State<SoonScreen> {
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      body: Column(
        children: [
          SoonHeader(
            isBack: widget.isBack,
          ),
          Expanded(
            child: Center(
              child: SquareImageContainer(
                image: AssetImage("assets/images/soon.png"),
                size: 250.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
