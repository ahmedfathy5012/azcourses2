import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/default_dialog.dart';
import 'package:azcourses/ui/widgets/global/custom_text_field.dart';
import 'package:azcourses/ui/widgets/global/image_container.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/utils/constants.dart';



class PaymentMethod{
  int id;
  String image;

  PaymentMethod({
    this.id, this.image
});

}

class PaymentSheet extends StatefulWidget {
  @override
  _PaymentSheetState createState() => _PaymentSheetState();
}



List<PaymentMethod> paymentMethods = [
  PaymentMethod(
    id: 0,
    image: "assets/icons/Group1000.png",
  ),
  PaymentMethod(
    id: 1,
    image: "assets/icons/Group2000.png",
  ),
  PaymentMethod(
    id: 2,
    image: "assets/icons/Group3000.png",
  ),
  PaymentMethod(
    id: 3,
    image: "assets/icons/Group4000.png",
  ),
];

class _PaymentSheetState extends State<PaymentSheet> {
  int _currentIndex=0;

  TextEditingController _nameController;
  TextEditingController _passwordController;
  TextEditingController _expiryDateController;
  TextEditingController _cvvController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _expiryDateController = TextEditingController();
    _passwordController = TextEditingController();
    _cvvController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _expiryDateController.dispose();
    _passwordController.dispose();
    _cvvController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenHelper.screenHeight(context, 693),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(ScreenHelper.screenRadius(context, 27)),
            topLeft: Radius.circular(ScreenHelper.screenRadius(context, 27))),
      ),
      child: Stack(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context,16)),
            child: ListView(
              children: [
                SizedBox(
                  height: ScreenHelper.screenHeight(context, 19),
                ),
                Container(
                  height: ScreenHelper.screenHeight(context, 161.5),
                  width: ScreenHelper.screenWidth(context, 343),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(ScreenHelper.screenRadius(context, 12))),
                      color: MAINCOLOR,
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xff7FEA99), Color(0xff34CC86)])),
                  child: Padding(
                    padding:  EdgeInsets.all(ScreenHelper.screenWidth(context, 15)),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: ImageContainer(
                        width: 43.732,
                        height: 15,
                        image: AssetImage("assets/icons/madaa.png"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenHelper.screenHeight(context, 37),
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      "نوع البطاقة",
                      textAlign: TextAlign.start,
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.headline1.copyWith(
                          fontSize: ScreenHelper.screenFont(context,16),
                          color: Color(0xff383838)
                      ),
                    ),
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 20),
                    ),

                      ],
                    ),
                SizedBox(
                  height: ScreenHelper.screenHeight(context, 20),
                ),
                Container(
                  height: ScreenHelper.screenHeight(context, 120),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        for(int i = 0 ; i<paymentMethods.length ; i++ )
                          Padding(
                            padding:  EdgeInsets.only(left: ScreenHelper.screenWidth(context,i==3?0:30.5)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ImageContainer(
                                  image: AssetImage(paymentMethods[i].image),
                                  height: 47,
                                  width: 63,
                                ),
                                 Radio(
                                   onChanged: (val) {
                                     print(val);
                                     setState(() {
                                       _currentIndex = val;
                                     });
                                   },
                                   activeColor: MAINCOLOR,
                                   groupValue: _currentIndex,
                                   value: paymentMethods[i].id,
                                 )
                              ],
                            ),
                          ),

                      ],
                    ),
                  ),
                ),
                CustomTextField(
                  label: "اسم صاحب البطاقة",
                  textColor: MAINCOLOR,
                 flatBorderHeight: 1,
                 controller: _nameController,
                ),
                CustomTextField(
                  keyboardType: TextInputType.number,
                  label: "رقم البطاقة",
                  textColor: MAINCOLOR,
                  controller: _passwordController,
                  flatBorderHeight: 1,

                ),
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: ScreenHelper.screenWidth(context, 132),
                      child: CustomTextField(
                        keyboardType: TextInputType.number,
                        label: "تاريخ الانتهاء(yy/mm)",
                        textColor: MAINCOLOR,
                        controller: _expiryDateController,
                        flatBorderHeight: 1,
                      ),
                    ),
                    SizedBox(
                      width: ScreenHelper.screenWidth(context, 132),
                      child: CustomTextField(
                        keyboardType: TextInputType.number,
                        label: "cvv",
                        textColor: MAINCOLOR,
                        controller: _cvvController,
                        flatBorderHeight: 1,
                      ),
                    ),

                  ],
                ),
                SizedBox(
                  height: ScreenHelper.screenHeight(context,85),
                ),
              ],
            ),
            ),
          Padding(
            padding:  EdgeInsets.only(
              bottom: ScreenHelper.screenHeight(context, 17),
              right: ScreenHelper.screenWidth(context, 69),
              left:  ScreenHelper.screenWidth(context, 69)
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: UsedButton(
                title: "شراء",
                onTap: (){
                  Get.dialog(
                    Center(
                       child:  DefaultDialog(
                         title: "التأكيد علي الدفع",
                         subtitle: "هل انت متأكد من الدفع , عند الدفع لا يمكن التراجع",
                         rightButton: "نعم , تأكيد الدفع",
                         leftButton: "العودة",
                         leftButtonTap: (){
                           Get.back();
                         },
                         rightButtonTap:  (){
                           Get.back();
                         },
                       ),
                    )
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }


}
