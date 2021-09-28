import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/global/signup_screen.dart';
import 'package:azcourses/ui/widgets/global/back_ground.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:azcourses/ui/widgets/global/carsoul_item.dart';
import 'package:azcourses/ui/widgets/global/draw_dots.dart';
import 'package:azcourses/ui/widgets/global/image_container.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/utils/constants.dart';




class CarsoulItemData {
  int id;
  String image;
  String title;
  String subtitle;

  CarsoulItemData({this.id, this.image, this.title, this.subtitle});
}



List<CarsoulItemData> carsoulData = [
  CarsoulItemData(
    id: 0,
    image: "assets/images/tt.png",
    title: "التسجيل كمعلم",
    subtitle: "التسجيل كطالب يتيح لك لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص"
  ),
  CarsoulItemData(
      id: 1,
      image: "assets/images/ddd.png",
      title: "التسجيل كطالب",
      subtitle: "التسجيل كطالب يتيح لك لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص"
  ),
  CarsoulItemData(
      id: 2,
      image: "assets/images/22.png",
      title: "التسجيل كولي أمر",
      subtitle: "التسجيل كطالب يتيح لك لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص"
  ),
];



class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}




class _CreateAccountState extends State<CreateAccount> {


  PageController pageController ;




  int carsoulIndex = 0;




  List<String> images = [
    "assets/images/tt.png",
    "assets/images/ddd.png",
    "assets/images/22.png"
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Stack(
          children: [
            BackGround(),
            Column(
              children: [
                SizedBox(
                  height: ScreenHelper.screenHeight(context,50),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context,17)),
                  child: Row(
                    textDirection: TextDirection.rtl,

                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: ImageContainer(
                          image: AssetImage("assets/icons/backicon.png"),
                          height: 14,
                          width: 31,
                        ),
                      ),
                      SizedBox(
                        width: ScreenHelper.screenWidth(context, 91.12),
                      ),
                      Text(
                        "تسجيل الدخول",
                        style: Theme.of(context).textTheme.headline1.copyWith(
                            fontSize: ScreenHelper.screenFont(context,17),
                            color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenHelper.screenHeight(context,50),
                ),
                CarouselSlider.builder(
                  itemCount: 3,
                  options: CarouselOptions(
                    onPageChanged: (index,_){
                      setState(() {
                        carsoulIndex=index;

                      });
                    },
                    autoPlay: false,
                    aspectRatio: 1.5,
                    enlargeCenterPage: true,
                    viewportFraction: .6,
                    height: ScreenHelper.screenHeight(context, 308.0),
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context,0)),
                      child: CarsoulItem(image: carsoulData[index].image,),
                    );
                  }
                ),
                SizedBox(
                  height: ScreenHelper.screenHeight(context, 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for(int i =0 ; i<3 ; i++)
                      Padding(
                        padding:  EdgeInsets.only(right: ScreenHelper.screenWidth(context, 9)),
                        child: DrawDot(i==carsoulIndex),
                      )
                  ],
                ),
                SizedBox(
                  height: ScreenHelper.screenHeight(context, 60),
                ),
                Column(
                  children: [
                    Text(
                      carsoulData[carsoulIndex].title,
                      style: Theme.of(context).textTheme.headline3.copyWith(
                          fontSize: ScreenHelper.screenFont(context,36),
                          color: Colors.white
                      ),
                    ),
                    SizedBox(
                      height: ScreenHelper.screenHeight(context,5),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context, 65)),
                      child: Text(
                        carsoulData[carsoulIndex].subtitle,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline2.copyWith(
                            fontSize: ScreenHelper.screenFont(context,14),
                            color: DARKCOLOR
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(
                  left: ScreenHelper.screenWidth(context, 69),
                  right:  ScreenHelper.screenWidth(context, 69),
                  bottom:  ScreenHelper.screenHeight(context, 30),

              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: UsedButton(
                  onTap: (){
                     Get.to(SignUpScreen(),
                     transition: Transition.cupertino
                     );
                  },
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(
                          "أبدأ التسجيل",
                          style: Theme.of(context).textTheme.headline3.copyWith(
                            fontSize: ScreenHelper.screenFont(context, 16),
                            color: Colors.white,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        SizedBox(
                          width: ScreenHelper.screenWidth(context,9),
                        ),
                        ImageContainer(
                          width: 16,
                          height: 11,
                          image: AssetImage(
                             "assets/icons/backiconback.png"
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )

    );
  }
}
