import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/utils/constants.dart';





class AssetContainer extends StatefulWidget {
  String title;
  String size;
  Function onTap;
  Color backColor;
  Color iconColor;
  String url;

  AssetContainer(
      {this.title,
      this.size,
      this.onTap,
      this.backColor = ULTRAGREYCOLOR,
      this.iconColor = DISABLENAVBARCOLOR,
      this.url
      });

  @override
  _AssetContainerState createState() => _AssetContainerState();
}

class _AssetContainerState extends State<AssetContainer> {

  Future<String> downloadFile(String url) async {
    final externalDir = await getExternalStorageDirectory();
    final dir = externalDir.path;
    HttpClient httpClient = new HttpClient();
    File file;
    String filePath = '';
    String myUrl = '';
    String fileName = "courseData${DateTime.now()}";

    try {
      myUrl = url+'/'+fileName;
      myUrl = url;
      var request = await httpClient.getUrl(Uri.parse(myUrl));
      var response = await request.close();
      if(response.statusCode == 200) {
        var bytes = await consolidateHttpClientResponseBytes(response);
        filePath = '$dir/$fileName';
        file = File(filePath);
        await file.writeAsBytes(bytes);
      }
      else
        filePath = 'Error code: '+response.statusCode.toString();
    }
    catch(ex){
      filePath = 'Can not fetch url';
    }

    return filePath;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.onTap();
        // await downloadFile(widget.url);
      },
      child: Container(
        width: ScreenHelper.screenWidth(context, 157),
        height: ScreenHelper.screenHeight(context, 55),
        decoration: BoxDecoration(
            color: widget.backColor,
            borderRadius: BorderRadius.all(
                Radius.circular(ScreenHelper.screenRadius(context, 4)))),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenHelper.screenWidth(context, 11)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: widget.iconColor,
                radius: ScreenHelper.screenWidth(context, 17),
                child: Icon(
                  Icons.file_download,
                  color: Colors.white,
                  size: ScreenHelper.screenHeight(context, 20),
                ),
              ),
              SizedBox(
                width: ScreenHelper.screenWidth(context, 10),
              ),
              Container(
                height: ScreenHelper.screenHeight(context, 55),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.title,
                        style: Theme.of(context).textTheme.headline1.copyWith(
                            fontSize: ScreenHelper.screenFont(context, 12.0),
                            color: DISABLENAVBARCOLOR),
                      ),
                      Text(
                        "${widget.size}MB",
                        style: Theme.of(context).textTheme.headline1.copyWith(
                            fontSize: ScreenHelper.screenFont(context, 12.0),
                            color: DISABLENAVBARCOLOR),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
