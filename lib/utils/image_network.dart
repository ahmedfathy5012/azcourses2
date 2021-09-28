import 'package:azcourses/helpers/screen_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class ImageNetwork extends StatelessWidget {
  final String url;
  final double width, height;
  final String placeholder;
  final double placeholderHeight;
  const ImageNetwork({@required this.url, this.placeholderHeight = 28.0, this.width , this.height,this.placeholder});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: ScreenHelper.screenHeight(context,height),
      width: ScreenHelper.screenWidth(context,width),
      imageUrl: url??" ",
      fit: BoxFit.cover,
      placeholder: (context, url) =>
      placeholder!=null?
          Center(
            child: Image.asset(
        'assets/icons/${placeholder}',
         height: ScreenHelper.screenHeight(context,placeholderHeight),
      ),
          ):SizedBox(height: 0,),
      errorWidget: (context, url, error) =>
      const Icon(Icons.error, color: Colors.red),
    );
  }
}