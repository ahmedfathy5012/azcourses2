import 'package:flutter/material.dart';
import 'package:azcourses/bloc/model/lecturer.dart';
import 'package:azcourses/bloc/model/teacher.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/utils/constants.dart';

class TeacherInfo extends StatefulWidget {
  Lecturer lecturer;

  TeacherInfo({this.lecturer});

  @override
  _TeacherInfoState createState() => _TeacherInfoState();
}

class _TeacherInfoState extends State<TeacherInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: ScreenHelper.screenWidth(context, 16),
        right: ScreenHelper.screenWidth(context, 16),
        top: ScreenHelper.screenHeight(context, 27),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          infoItem(
              icon: "assets/icons/15.png",
              title: "المادة الدراسية",
             subTitle: widget.lecturer.subjects.toString()
              // subTitle: "عربي"
          ),
          SizedBox(
            height: ScreenHelper.screenHeight(context, 20),
          ),
          infoItem(
              icon: "assets/icons/16.png",
              title: "الصفوف الدراسية",
             subTitle: widget.lecturer.years
              // subTitle: "الاول الثانوي"
          ),
          SizedBox(
            height: ScreenHelper.screenHeight(context, 20),
          ),
//           infoItem(
//               icon: "assets/icons/17.png",
//               title: "العنوان",
// //              subTitle: widget.teacher.address
//               subTitle: "وصف للعنوان"),
//           SizedBox(
//             height: ScreenHelper.screenHeight(context, 20),
//           ),
          infoItem(
              icon: "assets/icons/18.png",
              title: "نبذه عنه",
             subTitle: widget.lecturer.desription
//               subTitle: "وصف للمدرس"
          ),
          SizedBox(
            height: ScreenHelper.screenHeight(context, 20),
          ),
        ],
      ),
    );
  }

  Widget infoItem({String icon, String title, String subTitle}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: TextDirection.rtl,
      children: [
        SquareImageContainer(
          image: AssetImage(icon),
          size: 17.0,
        ),
        SizedBox(
          width: ScreenHelper.screenWidth(context, 10),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: [
            Text(
              title,
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.caption.copyWith(
                  color: GREYCOLOR,
                  fontSize: ScreenHelper.screenWidth(context, 12)),
            ),
            SizedBox(
              height: ScreenHelper.screenHeight(context, 4),
            ),
            Container(
              width: ScreenHelper.screenWidth(context, 300),
              child: Text(
                subTitle,
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.headline2.copyWith(
                    color: DARKBLACKCOLOR,
                    fontSize: ScreenHelper.screenWidth(context, 16)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
