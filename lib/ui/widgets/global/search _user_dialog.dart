import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/custom_text_field.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/utils/constants.dart';

class SearchUSerDialog extends StatefulWidget {
  @override
  _SearchUSerDialogState createState() => _SearchUSerDialogState();
}

class _SearchUSerDialogState extends State<SearchUSerDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width:  ScreenHelper.screenWidth(context, 343),
        height: ScreenHelper.screenWidth(context, 444),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(ScreenHelper.screenRadius(context, 19))),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
             Padding(
               padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context, 45)),
               child: Column(
                 children: [
                   SizedBox(
                     height: ScreenHelper.screenHeight(context, 24),
                   ),
                   Text(
                     "اكتب اسم الطالب",
                     style: Theme.of(context).textTheme.headline1.copyWith(
                         fontSize: ScreenHelper.screenFont(context,16),
                         color: Color(0xff383838)
                     ),
                   ),
                   SizedBox(
                     height: ScreenHelper.screenHeight(context, 9),
                   ),
                   Text(
                     "من فضلك اكتب اسم المستخدم لدي الطالب الذي سجل به في المنصة و ليس الاسم الحقيقي",
                     textAlign: TextAlign.center,
                     style: Theme.of(context).textTheme.headline2.copyWith(
                         fontSize: ScreenHelper.screenFont(context,12),
                         color: Color(0xffACACAC)
                     ),
                   ),
                   SizedBox(
                     height: ScreenHelper.screenHeight(context, 24),
                   ),
                 ],
               ),
             ),
              Divider(
                color:  Color(0xffACACAC),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context, 14)),
                child: Column(
                  children: [
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 24),
                    ),
                    CustomTextField(
                      label: "ادخل اسم الطالب",
                      textColor: Color(0xff130F40),
                      onChanged: (value){
                        setState(() {
                          print(value);
                        });
                      },
                    ),
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 11),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: ScreenHelper.screenHeight(context, 200),
                            width:  ScreenHelper.screenWidth(context,256),
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenHelper.screenRadius(context, 7))),
                                color: Color(0xffE4EBF3)
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(
                                horizontal: ScreenHelper.screenWidth(context, 17),
                                vertical: ScreenHelper.screenHeight(context,19)
                              ),
                              child: ListView.separated(
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                        onTap: (){

                                        },
                                        child: Text(
                                    "اكتب اسم الطالب",
                                    style: Theme.of(context).textTheme.headline1.copyWith(
                                          fontSize: ScreenHelper.screenFont(context,16),
                                          color: Color(0xff383838)
                                    ),
                                  ),
                                      ),
                                  separatorBuilder: (context, index) => SizedBox(
                                    height: ScreenHelper.screenHeight(context, 18),
                                  ),
                                  itemCount: 10,
                                  shrinkWrap: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: ScreenHelper.screenHeight(context,30),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context, 108)),
                      child: UsedButton(
                        title: "حفظ",
                        onTap: (){
                          Get.back();
                        },

                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
