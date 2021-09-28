import 'package:flutter/material.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'asset_container.dart';

class ClassAsset extends StatelessWidget {
  String pdfAsset;
  String imageAsset;


  ClassAsset({this.pdfAsset, this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ملحقات الفيديو",
          style: Theme.of(context).textTheme.headline2.copyWith(
              fontSize: ScreenHelper.screenFont(context, 16.0),
              color: DARKBLACKCOLOR),
        ),
        SizedBox(
          height: ScreenHelper.screenHeight(context, 14),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            pdfAsset==null || pdfAsset.isEmpty?
                SizedBox(width: 0.0,):
            AssetContainer(
              title: "تحميل الشرح",
              size: "",
              url: pdfAsset,
              backColor: Color(0xffDAFFEE),
              iconColor: MAINCOLOR,
              onTap: ()async{
                print("myyyyyyyyyyyy fileeeeeeeee pdf  $imageAsset");
                // final status = await Permission.storage.request();
                // if(status.isGranted){
                  final externalDir = await getExternalStorageDirectory();
                  await FlutterDownloader.enqueue(
                    url:
                    pdfAsset,
                    // "https://firebasestorage.googleapis.com/v0/b/storage-3cff8.appspot.com/o/2020-05-29%2007-18-34.mp4?alt=media&token=841fffde-2b83-430c-87c3-2d2fd658fd41",
                    savedDir: externalDir.path,
                    fileName: "products",
                    showNotification: true,
                    openFileFromNotification: true,
                  );

                }
              // },
            ),
            imageAsset==null || imageAsset.isEmpty?
            SizedBox(width: 0.0,):
            AssetContainer(
              title: "سورة السبورة",
              size: "",
              url: imageAsset,
              backColor: Color(0xffFFEDAC),
              iconColor: Color(0xffF9CA24),
              onTap: ()async{
                print("myyyyyyyyyyyy fileeeeeeeee $imageAsset");
                final status = await Permission.storage.request();
                if(status.isGranted){
                  final externalDir = await getExternalStorageDirectory();
                  await FlutterDownloader.enqueue(
                    url:imageAsset,
                    // "https://firebasestorage.googleapis.com/v0/b/storage-3cff8.appspot.com/o/2020-05-29%2007-18-34.mp4?alt=media&token=841fffde-2b83-430c-87c3-2d2fd658fd41",
                    savedDir: externalDir.path,
                    fileName: "products",
                    showNotification: true,
                    openFileFromNotification: true,
                  );

                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
