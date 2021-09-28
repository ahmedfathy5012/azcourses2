import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/default_dialog.dart';
import 'package:azcourses/ui/widgets/global/cong_dialog.dart';
import 'package:azcourses/ui/widgets/global/image_container.dart';
import 'package:azcourses/ui/widgets/global/search%20_user_dialog.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/utils/constants.dart';


class PointTransferScreen extends StatefulWidget {
  @override
  _PointTransferScreenState createState() => _PointTransferScreenState();
}

class _PointTransferScreenState extends State<PointTransferScreen> {
  double sliderValue = 200.0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView(
        children: [
          SizedBox(
            height: ScreenHelper.screenHeight(context,16),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context, 16)),
            child: Container(
              height: ScreenHelper.screenHeight(context, 174),
              width: ScreenHelper.screenWidth(context,343),
              decoration: BoxDecoration(
                color: Color(0xffF4F6FF),
                borderRadius: BorderRadius.all(Radius.circular(ScreenHelper.screenRadius(context, 7))),
                border: Border.all(
                  color: MAINCOLOR,
                  width: 1
                )
              ),
              child: false?Column(
                children: [
                  SizedBox(
                    height: ScreenHelper.screenHeight(context,22),
                  ),
                  Container(
                   height: ScreenHelper.screenHeight(context, 60),
                   width:  ScreenHelper.screenHeight(context, 60),
                   clipBehavior: Clip.hardEdge,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.all(Radius.circular(ScreenHelper.screenRadius(context, 30))),
                     image: DecorationImage(
                       image: AssetImage(
                         "assets/icons/logo.png"
                       ),
                     )
                   ),
                 ),
                  SizedBox(
                    height: ScreenHelper.screenHeight(context,22),
                  ),
                  Text(
                    "مهند توركي97",
                    style: Theme.of(context).textTheme.headline2.copyWith(
                        fontSize: ScreenHelper.screenFont(context,14),
                        color: CUSTOMGREYCOLOR
                    ),
                  ),
                  SizedBox(
                    height: ScreenHelper.screenHeight(context,22),
                  ),
                  Text(
                    "الصف الاول الثانوي",
                    style: Theme.of(context).textTheme.headline2.copyWith(
                        fontSize: ScreenHelper.screenFont(context,14),
                        color: CUSTOMGREYCOLOR
                    ),
                  ),
                ],
              ):
                 GestureDetector(
                   onTap: (){
                     Get.dialog(
                         Center(child: SearchUSerDialog())
                     );
                   },
                   child: Center(
                     child: Container(
                       height: ScreenHelper.screenHeight(context, 50),
                       width:  ScreenHelper.screenHeight(context, 50),
                       decoration: BoxDecoration(
                         color: Colors.transparent,
                         borderRadius: BorderRadius.all(Radius.circular(ScreenHelper.screenRadius(context, 50))),
                         border: Border.all(color: MAINCOLOR,width: 1),
                       ),
                       child: Icon(Icons.add,color: MAINCOLOR,size: ScreenHelper.screenHeight(context, 30),),
                     ),
                   ),
                 ),
            ),
          ),
          SizedBox(height: ScreenHelper.screenHeight(context, 46),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              circleButton(context: context,icon: Icons.add , onTap: (){
                setState(() {
                  sliderValue++;
                });
              }),
              SizedBox(width: ScreenHelper.screenWidth(context, 25),),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    sliderValue.round().toString(),
                    style: Theme.of(context).textTheme.headline3.copyWith(
                        fontSize: ScreenHelper.screenFont(context,25),
                        color: CUSTOMGREYCOLOR
                    ),
                  ),
                  SizedBox(height: ScreenHelper.screenWidth(context, 5),),
                  Text(
                    "نقطة",
                    style: Theme.of(context).textTheme.headline1.copyWith(
                        fontSize: ScreenHelper.screenFont(context,16),
                        color: CUSTOMGREYCOLOR
                    ),
                  ),
                ],
              ),
              SizedBox(width: ScreenHelper.screenWidth(context, 25),),
              circleButton(context: context,icon: Icons.remove , onTap: (){
                setState(() {
                  sliderValue--;
                });
              }),
            ],
          ),
          SizedBox(height: ScreenHelper.screenHeight(context, 46),),
          SliderTheme(
            data: SliderThemeData(
              activeTickMarkColor: MAINCOLOR,
              activeTrackColor: MAINCOLOR,
              inactiveTrackColor: Color(0xffE8E8E8),
              thumbColor: MAINCOLOR,
              thumbShape: RoundSliderThumbShape(
                  enabledThumbRadius:
                  ScreenHelper.screenHeight(context, 20)),
            ),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Slider(
                  value: sliderValue,
               onChanged: (value){
                    setState(() {
                      sliderValue = value;
                    });
               },
                min: 0,
                max: 1000,
              ),
            ),
          ),
          SizedBox(height: ScreenHelper.screenHeight(context, 41),),
          Container(
            width: double.infinity,
            height: ScreenHelper.screenHeight(context, 60),
            child: Padding(
              padding:  EdgeInsets.only(right: ScreenHelper.screenWidth(context, 16)),
              child: ListView.separated(
                itemBuilder: (context, index) => pointContainer(
                    onTap: (){
                      setState(() {
                        sliderValue=(index+1.0)*100;
                      });
                    } ,
                    context: context ,
                    points: sliderValue.round()
                ),
                separatorBuilder: (context, index) => SizedBox(width: ScreenHelper.screenWidth(context, 17),),
                itemCount: 20,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          SizedBox(height: ScreenHelper.screenHeight(context, 61),),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context, 108)),
            child: UsedButton(
              title: "حفظ",
              onTap: (){
                Get.dialog(
                    Center(
                      child:  DefaultDialog(
                        title: "التأكيد علي التحويل",
                        subtitle: "هل انت متأكد من التحويل , عند التحويل لا يمكن التراجع",
                        rightButton: "نعم , تأكيد التحويل",
                        leftButton: "العودة",
                        leftButtonTap: (){
                          Get.back();
                        },
                        rightButtonTap:  (){
                          Get.back();
                          Get.dialog(
                              Center(
                                  child: CongDialog(
                                    onTap: (){
                                      Get.back();
                                    },
                                    title: "تهانينا",
                                    subtitle: "تم شراء النقاط بنجاح ,اطلع علي رصيدك الحالي",
                                    buttonTitle: "العودة",
                                  )
                              )
                          );
                        },
                      ),
                    )
                );

              },

            ),
          ),
          SizedBox(height: ScreenHelper.screenHeight(context, 41),),
        ],
      ),
    );
  }


  Widget pointContainer({BuildContext context , Function onTap , int points}){
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: ScreenHelper.screenWidth(context, 100),
            height:  ScreenHelper.screenHeight(context, 60),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(ScreenHelper.screenRadius(context,4))),
              color: Color(0xffEEEEEE),
            ),
            child:
            Align(
              alignment: Alignment.center,
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    "500",
                    style: Theme.of(context).textTheme.headline3.copyWith(
                        fontSize: ScreenHelper.screenFont(context,18),
                        color: Color(0xffB5B5B5)
                    ),
                  ),
                  SizedBox(height: ScreenHelper.screenWidth(context, 7),),
                  Text(
                    "نقطة",
                    style: Theme.of(context).textTheme.headline2.copyWith(
                        fontSize: ScreenHelper.screenFont(context,11),
                        color: Color(0xffB5B5B5)
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

}


Widget circleButton({BuildContext context , Function onTap , IconData icon}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: ScreenHelper.screenWidth(context, 25),
      width:  ScreenHelper.screenWidth(context, 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(ScreenHelper.screenRadius(context,15))),
        color: Color(0xffEEEEEE),
      ),
      child: Center(
        child: Icon(icon,color: Color(0xffB5B5B5),size: ScreenHelper.screenWidth(context, 18),),
      ),
    ),
  );
}
